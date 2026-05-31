import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/core/failures/failure.dart';
import '../../../domain/mood/value_objects/mood_tag.dart';
import '../../../domain/music/entities/music_track.dart';
import '../../../domain/music/entities/youtube_search_result.dart';
import '../../../domain/music/repositories/i_youtube_repository.dart';
import '../../../domain/music/value_objects/track_source.dart';

@lazySingleton
class YouTubeRepositoryImpl implements IYouTubeRepository {
  static const String _baseUrl = 'https://www.googleapis.com/youtube/v3';

  /// PRD Tablo 3b: Mood → YouTube arama sorgusu eşleştirmesi
  static const Map<MoodTag, String> _moodQueryMap = {
    MoodTag.happy: 'happy mood music playlist 2024',
    MoodTag.sad: 'sad emotional music playlist',
    MoodTag.angry: 'aggressive workout music rock',
    MoodTag.fear: 'calming anxiety relief music',
    MoodTag.surprise: 'upbeat unexpected feel good music',
    MoodTag.neutral: 'lofi chill focus music',
  };

  /// Türkçe ruh hali adı → YouTube arama sorgusu
  static const Map<String, String> _turkishMoodQueryMap = {
    'mutlu': 'happy upbeat pop music 2024',
    'hüzünlü': 'sad emotional music playlist',
    'huzunlu': 'sad emotional music playlist',
    'sinirli': 'aggressive workout music rock',
    'sakin': 'lofi chill calm relaxing music',
    'enerjik': 'energetic workout motivation music',
    'yorgun': 'relaxing sleep music ambient',
    'aşık': 'romantic love songs playlist',
    'asik': 'romantic love songs playlist',
    'kaygılı': 'calming anxiety relief music',
    'kaygili': 'calming anxiety relief music',
    'heyecanlı': 'upbeat exciting feel good music',
    'heyecanli': 'upbeat exciting feel good music',
    'melankolik': 'melancholic slow sad songs',
    'özgüvenli': 'confident empowerment music',
    'ozguvenli': 'confident empowerment music',
    'coşkulu': 'party dance pop music',
    'coskulu': 'party dance pop music',
    'odaklanmış': 'lofi focus study music concentration',
    'odaklanmis': 'lofi focus study music concentration',
    'uykulu': 'sleep ambient relaxing music',
    'rahat': 'chill relaxed lofi music',
    'nostaljik': 'nostalgic 80s 90s classic songs',
    // ScanResultPage'den gelen İngilizce değerler
    'happy': 'happy upbeat pop music 2024',
    'sad': 'sad emotional music playlist',
    'angry': 'aggressive workout music rock',
    'fear': 'calming anxiety relief music',
    'surprise': 'upbeat exciting feel good music',
    'neutral': 'lofi chill focus music',
    // Keşfet ekranındaki ekstra duygu isimleri
    'üzgün': 'sad emotional music playlist',
    'uzgun': 'sad emotional music playlist',
    'kızgın': 'aggressive workout music rock',
    'kizgin': 'aggressive workout music rock',
    'korkmuş': 'calming anxiety relief music',
    'korkmus': 'calming anxiety relief music',
    'şaşkın': 'upbeat unexpected feel good music',
    'saskın': 'upbeat unexpected feel good music',
    'nötr': 'lofi chill focus music',
    'notr': 'lofi chill focus music',
  };

  String get _apiKey => dotenv.env['YOUTUBE_API_KEY'] ?? '';

  @override
  Future<Either<Failure, List<YouTubeSearchResult>>> searchByMood({
    required MoodTag moodTag,
    required String query,
  }) async {
    final searchQuery = query.isEmpty ? (_moodQueryMap[moodTag] ?? 'music') : query;

    final uri = Uri.parse('$_baseUrl/search').replace(queryParameters: {
      'part': 'snippet',
      'q': searchQuery,
      'type': 'video',
      'videoDuration': 'medium',
      'maxResults': '30',
      'key': _apiKey,
    });

    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 10));

      if (response.statusCode == 403) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        final errors = body['error']?['errors'] as List<dynamic>?;
        final reason = errors?.first?['reason'] as String?;
        if (reason == 'quotaExceeded') {
          return left(const Failure.youTubeQuota());
        }
        return left(const Failure.server(message: 'YouTube API erişim hatası (403)'));
      }

      if (response.statusCode != 200) {
        return left(Failure.server(message: 'HTTP ${response.statusCode}'));
      }

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final items = body['items'] as List<dynamic>? ?? [];

      if (items.isEmpty) {
        return left(const Failure.emptyTracks());
      }

      // Video ID'lerini topla, contentDetails için ikinci çağrı yap
      final videoIds = items
          .map((item) => (item['id'] as Map<String, dynamic>)['videoId'] as String)
          .toList();

      final detailsMap = await _fetchVideoDetails(videoIds);

      final results = items.map((item) {
        final id = (item['id'] as Map<String, dynamic>)['videoId'] as String;
        final snippet = item['snippet'] as Map<String, dynamic>;
        final thumbs = snippet['thumbnails'] as Map<String, dynamic>;
        final highThumb = (thumbs['high'] ?? thumbs['medium'] ?? thumbs['default'])
            as Map<String, dynamic>;

        return YouTubeSearchResult(
          videoId: id,
          title: snippet['title'] as String? ?? '',
          channelName: snippet['channelTitle'] as String? ?? '',
          thumbnailUrl: highThumb['url'] as String? ?? '',
          duration: detailsMap[id] ?? 'PT0S',
        );
      }).where((r) => _parseDurationToMs(r.duration) > 0 && _parseDurationToMs(r.duration) <= 600000).toList();

      return right(results);
    } on Exception catch (e) {
      return left(Failure.server(message: e.toString()));
    }
  }

  /// Videos endpoint'inden contentDetails çeker (süre bilgisi için)
  Future<Map<String, String>> _fetchVideoDetails(List<String> videoIds) async {
    if (videoIds.isEmpty) return {};

    final uri = Uri.parse('$_baseUrl/videos').replace(queryParameters: {
      'part': 'contentDetails',
      'id': videoIds.join(','),
      'key': _apiKey,
    });

    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 8));
      if (response.statusCode != 200) return {};

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final items = body['items'] as List<dynamic>? ?? [];

      return {
        for (final item in items)
          (item['id'] as String): ((item['contentDetails'] as Map<String, dynamic>?)?['duration'] as String?) ?? 'PT0S',
      };
    } catch (_) {
      return {};
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getVideoDetails(String videoId) async {
    final uri = Uri.parse('$_baseUrl/videos').replace(queryParameters: {
      'part': 'snippet,contentDetails,statistics',
      'id': videoId,
      'key': _apiKey,
    });

    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 8));
      if (response.statusCode != 200) {
        return left(Failure.server(message: 'HTTP ${response.statusCode}'));
      }

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final items = body['items'] as List<dynamic>? ?? [];

      if (items.isEmpty) return left(const Failure.server(message: 'Video bulunamadı'));

      return right(items.first as Map<String, dynamic>);
    } on Exception catch (e) {
      return left(Failure.server(message: e.toString()));
    }
  }

  @override
  MusicTrack convertToTrack(YouTubeSearchResult result, MoodTag moodTag) {
    return MusicTrack(
      id: const Uuid().v4(),
      title: result.title,
      artist: result.channelName,
      youtubeVideoId: result.videoId,
      youtubeUrl: 'https://youtu.be/${result.videoId}',
      thumbnailUrl: result.thumbnailUrl,
      channelName: result.channelName,
      moodTag: moodTag,
      source: TrackSource.youtubeApi,
      durationMs: _parseDurationToMs(result.duration),
    );
  }


  /// ISO 8601 süre (PT3M45S) → milisaniye
  int _parseDurationToMs(String iso8601) {
    final regex = RegExp(r'PT(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?');
    final match = regex.firstMatch(iso8601);
    if (match == null) return 0;

    final hours = int.tryParse(match.group(1) ?? '0') ?? 0;
    final minutes = int.tryParse(match.group(2) ?? '0') ?? 0;
    final seconds = int.tryParse(match.group(3) ?? '0') ?? 0;

    return ((hours * 3600) + (minutes * 60) + seconds) * 1000;
  }

  /// Türkçe ruh hali adından YouTube'da arama yapar
  Future<Either<Failure, List<YouTubeSearchResult>>> searchByMoodName(
      String moodName) async {
    final normalized = moodName.toLowerCase().trim();
    final searchQuery =
        _turkishMoodQueryMap[normalized] ?? 'music $moodName';

    final uri = Uri.parse('$_baseUrl/search').replace(queryParameters: {
      'part': 'snippet',
      'q': searchQuery,
      'type': 'video',
      'videoDuration': 'medium',
      'maxResults': '30',
      'key': _apiKey,
    });

    try {
      final response =
          await http.get(uri).timeout(const Duration(seconds: 10));

      if (response.statusCode == 403) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        final errors = body['error']?['errors'] as List<dynamic>?;
        final reason = errors?.first?['reason'] as String?;
        if (reason == 'quotaExceeded') {
          return left(const Failure.youTubeQuota());
        }
        return left(
            const Failure.server(message: 'YouTube API erişim hatası (403)'));
      }

      if (response.statusCode != 200) {
        return left(Failure.server(message: 'HTTP ${response.statusCode}'));
      }

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final items = body['items'] as List<dynamic>? ?? [];

      if (items.isEmpty) {
        return left(const Failure.emptyTracks());
      }

      final videoIds = items
          .map((item) =>
              (item['id'] as Map<String, dynamic>)['videoId'] as String)
          .toList();

      final detailsMap = await _fetchVideoDetails(videoIds);

      final results = items.map((item) {
        final id =
            (item['id'] as Map<String, dynamic>)['videoId'] as String;
        final snippet = item['snippet'] as Map<String, dynamic>;
        final thumbs = snippet['thumbnails'] as Map<String, dynamic>;
        final highThumb =
            (thumbs['high'] ?? thumbs['medium'] ?? thumbs['default'])
                as Map<String, dynamic>;

        return YouTubeSearchResult(
          videoId: id,
          title: snippet['title'] as String? ?? '',
          channelName: snippet['channelTitle'] as String? ?? '',
          thumbnailUrl: highThumb['url'] as String? ?? '',
          duration: detailsMap[id] ?? 'PT0S',
        );
      }).where((r) => _parseDurationToMs(r.duration) > 0 && _parseDurationToMs(r.duration) <= 600000).toList();

      return right(results);
    } on Exception catch (e) {
      return left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<YouTubeSearchResult>>> getPlaylistItems(String playlistId) async {
    final uri = Uri.parse('$_baseUrl/playlistItems').replace(queryParameters: {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '30',
      'key': _apiKey,
    });

    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 10));

      if (response.statusCode == 403) {
        return left(const Failure.youTubeQuota());
      }
      if (response.statusCode != 200) {
        return left(Failure.server(message: 'HTTP ${response.statusCode}'));
      }

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final items = body['items'] as List<dynamic>? ?? [];

      if (items.isEmpty) {
        return left(const Failure.emptyTracks());
      }

      final videoIds = items
          .map((item) {
            final snippet = item['snippet'] as Map<String, dynamic>?;
            return snippet?['resourceId']?['videoId'] as String?;
          })
          .where((id) => id != null)
          .cast<String>()
          .toList();

      final detailsMap = await _fetchVideoDetails(videoIds);

      final results = items.map((item) {
        final snippet = item['snippet'] as Map<String, dynamic>;
        final id = snippet['resourceId']?['videoId'] as String? ?? '';
        final thumbs = snippet['thumbnails'] as Map<String, dynamic>? ?? {};
        final highThumb = (thumbs['high'] ?? thumbs['medium'] ?? thumbs['default'] ?? {})
            as Map<String, dynamic>;

        return YouTubeSearchResult(
          videoId: id,
          title: snippet['title'] as String? ?? '',
          channelName: snippet['videoOwnerChannelTitle'] as String? ?? snippet['channelTitle'] as String? ?? '',
          thumbnailUrl: highThumb['url'] as String? ?? '',
          duration: detailsMap[id] ?? 'PT0S',
        );
      }).where((r) => r.videoId.isNotEmpty && _parseDurationToMs(r.duration) > 0 && _parseDurationToMs(r.duration) <= 600000).toList();

      return right(results);
    } on Exception catch (e) {
      return left(Failure.server(message: e.toString()));
    }
  }

  /// YouTubeSearchResult → MusicTrack (string mood adı ile)
  MusicTrack convertToTrackWithMoodName(
      YouTubeSearchResult result, String moodName) {
    // Türkçe ruh hali adını MoodTag'e çevir (yaklaşık)
    final tag = _moodNameToTag(moodName);
    return convertToTrack(result, tag);
  }

  MoodTag _moodNameToTag(String moodName) {
    final n = moodName.toLowerCase().trim();
    if (n.contains('mutlu') || n.contains('happy') || n.contains('coşkulu') || n.contains('heyecanl') || n.contains('özgüvenli')) {
      return MoodTag.happy;
    } else if (n.contains('hüzün') || n.contains('sad') || n.contains('melankolik') || n.contains('nostaljik') || n.contains('üzgün')) {
      return MoodTag.sad;
    } else if (n.contains('sinirl') || n.contains('angry') || n.contains('kızg') || n.contains('enerjik')) {
      return MoodTag.angry;
    } else if (n.contains('kaygı') || n.contains('fear') || n.contains('korkmuş') || n.contains('yorgun') || n.contains('uykulu')) {
      return MoodTag.fear;
    } else if (n.contains('şaşk') || n.contains('surprise') || n.contains('aşık')) {
      return MoodTag.surprise;
    } else {
      return MoodTag.neutral;
    }
  }
}
