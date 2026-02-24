import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/failures/failure.dart';
import '../../../domain/mood/value_objects/mood_tag.dart';
import '../../../domain/music/entities/music_track.dart';
import '../../../domain/music/entities/youtube_search_result.dart';
import '../../../domain/music/repositories/i_music_repository.dart';
import '../../../domain/music/value_objects/track_source.dart';

@LazySingleton(as: IMusicRepository)
class MockMusicRepository implements IMusicRepository {
  @override
  Future<Either<Failure, List<MusicTrack>>> getRecommendedTracksByMood(MoodTag mood) async {
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
        ),
        const MusicTrack(
          id: 'happy_2',
          title: 'Don\'t Stop Me Now',
          artist: 'Queen',
          youtubeVideoId: 'HgzGwKwLmgM',
          youtubeUrl: 'https://www.youtube.com/watch?v=HgzGwKwLmgM',
          moodTag: MoodTag.happy,
          source: TrackSource.manual,
        ),
        const MusicTrack(
          id: 'happy_3',
          title: 'Walking On Sunshine',
          artist: 'Katrina & The Waves',
          youtubeVideoId: 'iPUmE-tne5U',
          youtubeUrl: 'https://www.youtube.com/watch?v=iPUmE-tne5U',
          moodTag: MoodTag.happy,
          source: TrackSource.manual,
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
        ),
        const MusicTrack(
          id: 'sad_2',
          title: 'Fix You',
          artist: 'Coldplay',
          youtubeVideoId: 'k4V3Mo61fJM',
          youtubeUrl: 'https://www.youtube.com/watch?v=k4V3Mo61fJM',
          moodTag: MoodTag.sad,
          source: TrackSource.manual,
        ),
        const MusicTrack(
          id: 'sad_3',
          title: 'Let Her Go',
          artist: 'Passenger',
          youtubeVideoId: 'RBumgq5yVrA',
          youtubeUrl: 'https://www.youtube.com/watch?v=RBumgq5yVrA',
          moodTag: MoodTag.sad,
          source: TrackSource.manual,
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
        ),
        const MusicTrack(
          id: 'angry_2',
          title: 'Killing In The Name',
          artist: 'Rage Against The Machine',
          youtubeVideoId: 'bWXazVhlyxQ',
          youtubeUrl: 'https://www.youtube.com/watch?v=bWXazVhlyxQ',
          moodTag: MoodTag.angry,
          source: TrackSource.manual,
        ),
        const MusicTrack(
          id: 'angry_3',
          title: 'Chop Suey!',
          artist: 'System Of A Down',
          youtubeVideoId: 'CSvFpBOe8eY',
          youtubeUrl: 'https://www.youtube.com/watch?v=CSvFpBOe8eY',
          moodTag: MoodTag.angry,
          source: TrackSource.manual,
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
        ),
        const MusicTrack(
          id: 'fear_2',
          title: 'Fear of the Dark',
          artist: 'Iron Maiden',
          youtubeVideoId: 'qEja72CGZnE',
          youtubeUrl: 'https://www.youtube.com/watch?v=qEja72CGZnE',
          moodTag: MoodTag.fear,
          source: TrackSource.manual,
        ),
        const MusicTrack(
          id: 'fear_3',
          title: 'Welcome to the Nightmare',
          artist: 'Alice Cooper',
          youtubeVideoId: '1Lz1x53bLvw',
          youtubeUrl: 'https://www.youtube.com/watch?v=1Lz1x53bLvw',
          moodTag: MoodTag.fear,
          source: TrackSource.manual,
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
        ),
        const MusicTrack(
          id: 'surprise_2',
          title: 'Paranoid Android',
          artist: 'Radiohead',
          youtubeVideoId: 'sPLEbAVjiLA',
          youtubeUrl: 'https://www.youtube.com/watch?v=sPLEbAVjiLA',
          moodTag: MoodTag.surprise,
          source: TrackSource.manual,
        ),
        const MusicTrack(
          id: 'surprise_3',
          title: 'A Day in the Life',
          artist: 'The Beatles',
          youtubeVideoId: 'usNsCeOV4GM',
          youtubeUrl: 'https://www.youtube.com/watch?v=usNsCeOV4GM',
          moodTag: MoodTag.surprise,
          source: TrackSource.manual,
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
        ),
        const MusicTrack(
          id: 'neutral_2',
          title: 'Clair de Lune',
          artist: 'Claude Debussy',
          youtubeVideoId: 'CvFH_6DNRCY',
          youtubeUrl: 'https://www.youtube.com/watch?v=CvFH_6DNRCY',
          moodTag: MoodTag.neutral,
          source: TrackSource.manual,
        ),
        const MusicTrack(
          id: 'neutral_3',
          title: 'Lofi Hip Hop Radio',
          artist: 'Lofi Girl',
          youtubeVideoId: 'jfKfPfyJRdk',
          youtubeUrl: 'https://www.youtube.com/watch?v=jfKfPfyJRdk',
          moodTag: MoodTag.neutral,
          source: TrackSource.manual,
        ),
      ],
    };

    return Right(mockData[mood] ?? mockData[MoodTag.neutral]!);
  }

  @override
  Future<Either<Failure, List<YouTubeSearchResult>>> searchYouTubeTracks(String query) async {
    // For mock, we can just return a generic search result or not implemented since we skip YouTube API.
    await Future.delayed(const Duration(seconds: 1));
    return Right([
      YouTubeSearchResult(
        videoId: 'dQw4w9WgXcQ',
        title: 'Mock Search Result: $query',
        channelName: 'Mock Channel',
        thumbnailUrl: 'https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg',
      ),
    ]);
  }
}
