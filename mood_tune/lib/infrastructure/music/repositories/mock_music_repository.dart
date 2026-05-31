import 'package:fpdart/fpdart.dart';
// injectable import removed — MockMusicRepository is disabled in favor of MusicRepositoryImpl

import '../../../domain/core/failures/failure.dart';
import '../../../domain/mood/value_objects/mood_tag.dart';
import '../../../domain/music/entities/music_track.dart';
import '../../../domain/music/entities/youtube_search_result.dart';
import '../../../domain/music/repositories/i_music_repository.dart';
import '../../../domain/music/value_objects/track_source.dart';

// Artık MockMusicRepository kullanılmıyor — MusicRepositoryImpl aktif implementasyondur.
// Geliştirme/test amacıyla saklandı.
class MockMusicRepository implements IMusicRepository {
  @override
  Future<Either<Failure, List<MusicTrack>>> getTracksByMood(MoodTag mood) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final Map<MoodTag, List<MusicTrack>> mockData = {
      MoodTag.happy: [
        const MusicTrack(
          id: 'happy_1',
          title: 'Happy - Pharrell Williams',
          artist: 'Pharrell Williams',
          youtubeVideoId: 'y6Sxv-sUYtM',
          youtubeUrl: 'https://www.youtube.com/watch?v=y6Sxv-sUYtM',
          moodTag: MoodTag.happy,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'happy_2',
          title: 'Don\'t Stop Me Now',
          artist: 'Queen',
          youtubeVideoId: 'HgzGwKwLmgM',
          youtubeUrl: 'https://www.youtube.com/watch?v=HgzGwKwLmgM',
          moodTag: MoodTag.happy,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'happy_3',
          title: 'Walking On Sunshine',
          artist: 'Katrina & The Waves',
          youtubeVideoId: 'iPUmE-tne5U',
          youtubeUrl: 'https://www.youtube.com/watch?v=iPUmE-tne5U',
          moodTag: MoodTag.happy,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
      ],
      MoodTag.sad: [
        const MusicTrack(
          id: 'sad_1',
          title: 'Someone Like You',
          artist: 'Adele',
          youtubeVideoId: 'hLQl3WQQoQ0',
          youtubeUrl: 'https://www.youtube.com/watch?v=hLQl3WQQoQ0',
          moodTag: MoodTag.sad,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'sad_2',
          title: 'Fix You',
          artist: 'Coldplay',
          youtubeVideoId: 'k4V3Mo61fJM',
          youtubeUrl: 'https://www.youtube.com/watch?v=k4V3Mo61fJM',
          moodTag: MoodTag.sad,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'sad_3',
          title: 'Let Her Go',
          artist: 'Passenger',
          youtubeVideoId: 'RBumgq5yVrA',
          youtubeUrl: 'https://www.youtube.com/watch?v=RBumgq5yVrA',
          moodTag: MoodTag.sad,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
      ],
      MoodTag.angry: [
        const MusicTrack(
          id: 'angry_1',
          title: 'Break Stuff',
          artist: 'Limp Bizkit',
          youtubeVideoId: 'ZpUYjpKg9KY',
          youtubeUrl: 'https://www.youtube.com/watch?v=ZpUYjpKg9KY',
          moodTag: MoodTag.angry,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'angry_2',
          title: 'Killing In The Name',
          artist: 'Rage Against The Machine',
          youtubeVideoId: 'bWXazVhlyxQ',
          youtubeUrl: 'https://www.youtube.com/watch?v=bWXazVhlyxQ',
          moodTag: MoodTag.angry,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'angry_3',
          title: 'Chop Suey!',
          artist: 'System Of A Down',
          youtubeVideoId: 'CSvFpBOe8eY',
          youtubeUrl: 'https://www.youtube.com/watch?v=CSvFpBOe8eY',
          moodTag: MoodTag.angry,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
      ],
      MoodTag.fear: [
        const MusicTrack(
          id: 'fear_1',
          title: 'Breathe',
          artist: 'The Prodigy',
          youtubeVideoId: 'rmHDhVRvCEE',
          youtubeUrl: 'https://www.youtube.com/watch?v=rmHDhVRvCEE',
          moodTag: MoodTag.fear,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'fear_2',
          title: 'Fear of the Dark',
          artist: 'Iron Maiden',
          youtubeVideoId: 'qEja72CGZnE',
          youtubeUrl: 'https://www.youtube.com/watch?v=qEja72CGZnE',
          moodTag: MoodTag.fear,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'fear_3',
          title: 'Welcome to the Nightmare',
          artist: 'Alice Cooper',
          youtubeVideoId: '1Lz1x53bLvw',
          youtubeUrl: 'https://www.youtube.com/watch?v=1Lz1x53bLvw',
          moodTag: MoodTag.fear,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
      ],
      MoodTag.surprise: [
        const MusicTrack(
          id: 'surprise_1',
          title: 'Bohemian Rhapsody',
          artist: 'Queen',
          youtubeVideoId: 'fJ9rUzIMcZQ',
          youtubeUrl: 'https://www.youtube.com/watch?v=fJ9rUzIMcZQ',
          moodTag: MoodTag.surprise,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'surprise_2',
          title: 'Paranoid Android',
          artist: 'Radiohead',
          youtubeVideoId: 'sPLEbAVjiLA',
          youtubeUrl: 'https://www.youtube.com/watch?v=sPLEbAVjiLA',
          moodTag: MoodTag.surprise,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'surprise_3',
          title: 'A Day in the Life',
          artist: 'The Beatles',
          youtubeVideoId: 'usNsCeOV4GM',
          youtubeUrl: 'https://www.youtube.com/watch?v=usNsCeOV4GM',
          moodTag: MoodTag.surprise,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
      ],
      MoodTag.neutral: [
        const MusicTrack(
          id: 'neutral_1',
          title: 'Weightless',
          artist: 'Marconi Union',
          youtubeVideoId: 'UfcAVejslrU',
          youtubeUrl: 'https://www.youtube.com/watch?v=UfcAVejslrU',
          moodTag: MoodTag.neutral,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'neutral_2',
          title: 'Clair de Lune',
          artist: 'Claude Debussy',
          youtubeVideoId: 'CvFH_6DNRCY',
          youtubeUrl: 'https://www.youtube.com/watch?v=CvFH_6DNRCY',
          moodTag: MoodTag.neutral,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'neutral_3',
          title: 'Lofi Hip Hop Radio',
          artist: 'Lofi Girl',
          youtubeVideoId: 'jfKfPfyJRdk',
          youtubeUrl: 'https://www.youtube.com/watch?v=jfKfPfyJRdk',
          moodTag: MoodTag.neutral,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
      ],
    };

    return Right(mockData[mood] ?? mockData[MoodTag.neutral]!);
  }

  @override
  Future<Either<Failure, List<MusicTrack>>> getTracksByMoodName(String moodName) async {
    // Mock: moodName'i MoodTag'e çevir, mevcut mock verisini döndür
    final n = moodName.toLowerCase().trim();
    MoodTag tag;
    if (n.contains('mutlu') || n.contains('happy') || n.contains('enerjik') || n.contains('coşkulu') || n.contains('heyecanl')) {
      tag = MoodTag.happy;
    } else if (n.contains('hüzün') || n.contains('sad') || n.contains('melankolik') || n.contains('nostaljik') || n.contains('üzgün')) {
      tag = MoodTag.sad;
    } else if (n.contains('sinirl') || n.contains('angry') || n.contains('kızg')) {
      tag = MoodTag.angry;
    } else if (n.contains('kaygı') || n.contains('fear') || n.contains('korkmuş') || n.contains('yorgun') || n.contains('uykulu')) {
      tag = MoodTag.fear;
    } else if (n.contains('şaşk') || n.contains('surprise') || n.contains('aşık')) {
      tag = MoodTag.surprise;
    } else {
      tag = MoodTag.neutral;
    }
    return getTracksByMood(tag);
  }

  @override
  Future<Either<Failure, List<YouTubeSearchResult>>> searchYouTube(String query) async {
    // For mock, we can just return a generic search result or not implemented since we skip YouTube API.
    await Future.delayed(const Duration(seconds: 1));
    return Right([
      YouTubeSearchResult(
        videoId: 'dQw4w9WgXcQ',
        title: 'Mock Search Result for $query',
        channelName: 'Mock Channel',
        duration: '3:30',
        thumbnailUrl: 'https://img.youtube.com/vi/dQw4w9WgXcQ/hqdefault.jpg',
      ),
    ]);
  }

  @override
  Future<Either<Failure, List<MusicTrack>>> getRecentlyPlayedTracks() async {
    // Mock veri
    return Right([]);
  }

  @override
          youtubeUrl: 'https://www.youtube.com/watch?v=RBumgq5yVrA',
          moodTag: MoodTag.sad,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
      ],
      MoodTag.angry: [
        const MusicTrack(
          id: 'angry_1',
          title: 'Break Stuff',
          artist: 'Limp Bizkit',
          youtubeVideoId: 'ZpUYjpKg9KY',
          youtubeUrl: 'https://www.youtube.com/watch?v=ZpUYjpKg9KY',
          moodTag: MoodTag.angry,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'angry_2',
          title: 'Killing In The Name',
          artist: 'Rage Against The Machine',
          youtubeVideoId: 'bWXazVhlyxQ',
          youtubeUrl: 'https://www.youtube.com/watch?v=bWXazVhlyxQ',
          moodTag: MoodTag.angry,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'angry_3',
          title: 'Chop Suey!',
          artist: 'System Of A Down',
          youtubeVideoId: 'CSvFpBOe8eY',
          youtubeUrl: 'https://www.youtube.com/watch?v=CSvFpBOe8eY',
          moodTag: MoodTag.angry,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
      ],
      MoodTag.fear: [
        const MusicTrack(
          id: 'fear_1',
          title: 'Breathe',
          artist: 'The Prodigy',
          youtubeVideoId: 'rmHDhVRvCEE',
          youtubeUrl: 'https://www.youtube.com/watch?v=rmHDhVRvCEE',
          moodTag: MoodTag.fear,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'fear_2',
          title: 'Fear of the Dark',
          artist: 'Iron Maiden',
          youtubeVideoId: 'qEja72CGZnE',
          youtubeUrl: 'https://www.youtube.com/watch?v=qEja72CGZnE',
          moodTag: MoodTag.fear,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'fear_3',
          title: 'Welcome to the Nightmare',
          artist: 'Alice Cooper',
          youtubeVideoId: '1Lz1x53bLvw',
          youtubeUrl: 'https://www.youtube.com/watch?v=1Lz1x53bLvw',
          moodTag: MoodTag.fear,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
      ],
      MoodTag.surprise: [
        const MusicTrack(
          id: 'surprise_1',
          title: 'Bohemian Rhapsody',
          artist: 'Queen',
          youtubeVideoId: 'fJ9rUzIMcZQ',
          youtubeUrl: 'https://www.youtube.com/watch?v=fJ9rUzIMcZQ',
          moodTag: MoodTag.surprise,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'surprise_2',
          title: 'Paranoid Android',
          artist: 'Radiohead',
          youtubeVideoId: 'sPLEbAVjiLA',
          youtubeUrl: 'https://www.youtube.com/watch?v=sPLEbAVjiLA',
          moodTag: MoodTag.surprise,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'surprise_3',
          title: 'A Day in the Life',
          artist: 'The Beatles',
          youtubeVideoId: 'usNsCeOV4GM',
          youtubeUrl: 'https://www.youtube.com/watch?v=usNsCeOV4GM',
          moodTag: MoodTag.surprise,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
      ],
      MoodTag.neutral: [
        const MusicTrack(
          id: 'neutral_1',
          title: 'Weightless',
          artist: 'Marconi Union',
          youtubeVideoId: 'UfcAVejslrU',
          youtubeUrl: 'https://www.youtube.com/watch?v=UfcAVejslrU',
          moodTag: MoodTag.neutral,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'neutral_2',
          title: 'Clair de Lune',
          artist: 'Claude Debussy',
          youtubeVideoId: 'CvFH_6DNRCY',
          youtubeUrl: 'https://www.youtube.com/watch?v=CvFH_6DNRCY',
          moodTag: MoodTag.neutral,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
        const MusicTrack(
          id: 'neutral_3',
          title: 'Lofi Hip Hop Radio',
          artist: 'Lofi Girl',
          youtubeVideoId: 'jfKfPfyJRdk',
          youtubeUrl: 'https://www.youtube.com/watch?v=jfKfPfyJRdk',
          moodTag: MoodTag.neutral,
          source: TrackSource.manual,
          thumbnailUrl: 'https://via.placeholder.com/150',
          channelName: 'Unknown Channel',
        ),
      ],
    };

    return Right(mockData[mood] ?? mockData[MoodTag.neutral]!);
  }

  @override
  Future<Either<Failure, List<MusicTrack>>> getTracksByMoodName(String moodName) async {
    // Mock: moodName'i MoodTag'e çevir, mevcut mock verisini döndür
    final n = moodName.toLowerCase().trim();
    MoodTag tag;
    if (n.contains('mutlu') || n.contains('happy') || n.contains('enerjik') || n.contains('coşkulu') || n.contains('heyecanl')) {
      tag = MoodTag.happy;
    } else if (n.contains('hüzün') || n.contains('sad') || n.contains('melankolik') || n.contains('nostaljik') || n.contains('üzgün')) {
      tag = MoodTag.sad;
    } else if (n.contains('sinirl') || n.contains('angry') || n.contains('kızg')) {
      tag = MoodTag.angry;
    } else if (n.contains('kaygı') || n.contains('fear') || n.contains('korkmuş') || n.contains('yorgun') || n.contains('uykulu')) {
      tag = MoodTag.fear;
    } else if (n.contains('şaşk') || n.contains('surprise') || n.contains('aşık')) {
      tag = MoodTag.surprise;
    } else {
      tag = MoodTag.neutral;
    }
    return getTracksByMood(tag);
  }

  @override
  Future<Either<Failure, List<YouTubeSearchResult>>> searchYouTube(String query) async {
    // For mock, we can just return a generic search result or not implemented since we skip YouTube API.
    await Future.delayed(const Duration(seconds: 1));
    return Right([
      YouTubeSearchResult(
        videoId: 'dQw4w9WgXcQ',
        title: 'Mock Search Result for $query',
        channelName: 'Mock Channel',
        duration: '3:30',
        thumbnailUrl: 'https://img.youtube.com/vi/dQw4w9WgXcQ/hqdefault.jpg',
      ),
    ]);
  }

  @override
  Future<Either<Failure, List<MusicTrack>>> getRecentlyPlayedTracks() async {
    // Mock veri
    return Right([]);
  }

  @override
  Future<Either<Failure, Unit>> addTrackToRecentlyPlayed(MusicTrack track) async {
    // Mock implementation
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> clearRecentlyPlayed() async {
    return right(unit);
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getFavoritePlaylists() async {
    return right([]);
  }

  @override
  Future<Either<Failure, Unit>> addFavoritePlaylist(Map<String, dynamic> playlist) async {
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> removeFavoritePlaylist(String playlistId) async {
    return right(unit);
  }

  @override
  Future<Either<Failure, List<Map<String, String>>>> getFavoriteSongs() async {
    return right([]);
  }

  @override
  Future<Either<Failure, Unit>> addFavoriteSong(Map<String, String> song) async {
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> removeFavoriteSong(String title) async {
    return right(unit);
  }
}
