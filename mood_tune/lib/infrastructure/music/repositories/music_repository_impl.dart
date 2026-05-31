import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/failures/failure.dart';
import '../../../domain/mood/value_objects/mood_tag.dart';
import '../../../domain/music/entities/music_track.dart';
import '../../../domain/music/entities/youtube_search_result.dart';
import '../../../domain/music/value_objects/track_source.dart';
import '../../../domain/music/repositories/i_music_repository.dart';
import '../services/cache_service.dart';
import 'youtube_repository_impl.dart';
import '../../../presentation/core/state/player_state.dart';

@LazySingleton(as: IMusicRepository)
class MusicRepositoryImpl implements IMusicRepository {
  final YouTubeRepositoryImpl _youtubeRepo;
  final CacheService _cacheService;

  MusicRepositoryImpl(this._youtubeRepo, this._cacheService);

  @override
  Future<Either<Failure, List<MusicTrack>>> getTracksByMood(MoodTag moodTag) async {
    // 1. Firestore cache'e bak
    final cached = await _cacheService.getCachedResults(moodTag);
    if (cached != null && cached.isNotEmpty) {
      final tracks = cached
          .map((r) => _youtubeRepo.convertToTrack(r, moodTag))
          .where((t) => (t.durationMs ?? 0) > 0 && (t.durationMs ?? 0) <= 600000)
          .toList();
      if (tracks.length >= 20) {
        return right(tracks);
      }
    }

    // 2. YouTube API'yi çağır
    final failureOrResults = await _youtubeRepo.searchByMood(
      moodTag: moodTag,
      query: '',
    );

    return failureOrResults.fold(
      (failure) => left(failure),
      (results) async {
        // 3. Sonuçları cache'e yaz (async, bekleme)
        _cacheService.setCachedResults(moodTag, results);

        final tracks = results
            .map((r) => _youtubeRepo.convertToTrack(r, moodTag))
            .where((t) => (t.durationMs ?? 0) > 0 && (t.durationMs ?? 0) <= 600000)
            .toList();
        return right(tracks);
      },
    );
  }

  @override
  Future<Either<Failure, List<MusicTrack>>> getTracksByMoodName(String moodName) async {
    // Türkçe ruh hali adından YouTube'da arama yap
    final failureOrResults = await _youtubeRepo.searchByMoodName(moodName);

    return failureOrResults.fold(
      (failure) => left(failure),
      (results) {
        final tracks = results
            .map((r) => _youtubeRepo.convertToTrackWithMoodName(r, moodName))
            .where((t) => (t.durationMs ?? 0) > 0 && (t.durationMs ?? 0) <= 600000)
            .toList();
        return right(tracks);
      },
    );
  }

  @override
  Future<Either<Failure, List<YouTubeSearchResult>>> searchYouTube(String query) async {
    // Herhangi bir mood için query tabanlı arama
    final failureOrResults = await _youtubeRepo.searchByMood(
      moodTag: MoodTag.neutral,
      query: query,
    );
    return failureOrResults;
  }

  @override
  Future<Either<Failure, List<MusicTrack>>> getRecentlyPlayedTracks() async {
    final cached = await _cacheService.getRecentlyPlayed();
    if (cached != null) {
      final tracks = cached.map((map) {
        // Map'ten MusicTrack'e dönüşüm (CacheService JSON'dan okur)
        return MusicTrack(
          id: map['id'] as String,
          title: map['title'] as String,
          artist: map['artist'] as String,
          youtubeVideoId: map['youtubeVideoId'] as String,
          youtubeUrl: map['youtubeUrl'] as String,
          thumbnailUrl: map['thumbnailUrl'] as String,
          channelName: map['channelName'] as String,
          moodTag: MoodTag.values.firstWhere(
            (e) => e.name == map['moodTag'],
            orElse: () => MoodTag.neutral,
          ),
          source: TrackSource.values.firstWhere(
            (e) => e.name == map['source'],
            orElse: () => TrackSource.youtubeApi,
          ),
          durationMs: map['durationMs'] as int? ?? 0,
        );
      }).where((t) => (t.durationMs ?? 0) > 0 && (t.durationMs ?? 0) <= 600000).toList();
      PlayerState.updateRecentTracks(tracks);
      return right(tracks);
    }
    PlayerState.updateRecentTracks([]);
    return right([]);
  }

  @override
  Future<Either<Failure, Unit>> addTrackToRecentlyPlayed(MusicTrack track) async {
    final trackJson = {
      'id': track.id,
      'title': track.title,
      'artist': track.artist,
      'youtubeVideoId': track.youtubeVideoId,
      'youtubeUrl': track.youtubeUrl,
      'thumbnailUrl': track.thumbnailUrl,
      'channelName': track.channelName,
      'moodTag': track.moodTag.name,
      'source': track.source.name,
      'durationMs': track.durationMs,
    };
    await _cacheService.addRecentlyPlayed(trackJson);
    
    final current = List<MusicTrack>.from(PlayerState.recentTracks.value);
    current.removeWhere((t) => t.youtubeVideoId == track.youtubeVideoId);
    current.insert(0, track);
    PlayerState.updateRecentTracks(current);

    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> clearRecentlyPlayed() async {
    await _cacheService.clearRecentlyPlayed();
    PlayerState.updateRecentTracks([]);
    return right(unit);
  }

  @override
  Future<Either<Failure, List<MusicTrack>>> getPlaylistTracks(String playlistId) async {
    final failureOrResults = await _youtubeRepo.getPlaylistItems(playlistId);

    return failureOrResults.fold(
      (failure) => left(failure),
      (results) {
        final tracks = results
            .map((r) => _youtubeRepo.convertToTrack(r, MoodTag.neutral))
            .where((t) => (t.durationMs ?? 0) > 0 && (t.durationMs ?? 0) <= 600000)
            .toList();
        return right(tracks);
      },
    );
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getFavoritePlaylists() async {
    final playlists = await _cacheService.getFavoritePlaylists();
    if (playlists != null) {
      PlayerState.favoritePlaylists.value = playlists;
      return right(playlists);
    }
    return right([]);
  }

  @override
  Future<Either<Failure, Unit>> addFavoritePlaylist(Map<String, dynamic> playlist) async {
    await _cacheService.addFavoritePlaylist(playlist);
    final current = List<Map<String, dynamic>>.from(PlayerState.favoritePlaylists.value);
    current.removeWhere((p) => p['playlistId'] == playlist['playlistId']);
    current.insert(0, playlist);
    PlayerState.favoritePlaylists.value = current;
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> removeFavoritePlaylist(String playlistId) async {
    await _cacheService.removeFavoritePlaylist(playlistId);
    final current = List<Map<String, dynamic>>.from(PlayerState.favoritePlaylists.value);
    current.removeWhere((p) => p['playlistId'] == playlistId);
    PlayerState.favoritePlaylists.value = current;
    return right(unit);
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getMyPlaylists() async {
    final playlists = await _cacheService.getMyPlaylists();
    if (playlists != null) {
      PlayerState.myPlaylists.value = playlists;
      return right(playlists);
    }
    return right([]);
  }

  @override
  Future<Either<Failure, Unit>> addMyPlaylist(Map<String, dynamic> playlist) async {
    await _cacheService.addMyPlaylist(playlist);
    final current = List<Map<String, dynamic>>.from(PlayerState.myPlaylists.value);
    current.removeWhere((p) => p['id'] == playlist['id']);
    current.insert(0, playlist);
    PlayerState.myPlaylists.value = current;
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> removeMyPlaylist(String id) async {
    await _cacheService.removeMyPlaylist(id);
    final current = List<Map<String, dynamic>>.from(PlayerState.myPlaylists.value);
    current.removeWhere((p) => p['id'] == id);
    PlayerState.myPlaylists.value = current;
    return right(unit);
  }

  @override
  Future<Either<Failure, List<Map<String, String>>>> getFavoriteSongs() async {
    final songs = await _cacheService.getFavoriteSongs();
    if (songs != null) {
      PlayerState.favoriteSongs.value = songs;
      return right(songs);
    }
    return right([]);
  }

  @override
  Future<Either<Failure, Unit>> addFavoriteSong(Map<String, String> song) async {
    await _cacheService.addFavoriteSong(song);
    final current = List<Map<String, String>>.from(PlayerState.favoriteSongs.value);
    current.removeWhere((s) => s['title'] == song['title']);
    current.insert(0, song);
    PlayerState.favoriteSongs.value = current;
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> removeFavoriteSong(String title) async {
    await _cacheService.removeFavoriteSong(title);
    final current = List<Map<String, String>>.from(PlayerState.favoriteSongs.value);
    current.removeWhere((s) => s['title'] == title);
    PlayerState.favoriteSongs.value = current;
    return right(unit);
  }
}
