import 'package:fpdart/fpdart.dart';
import '../../core/failures/failure.dart';
import '../entities/music_track.dart';
import '../../mood/value_objects/mood_tag.dart';
import '../entities/youtube_search_result.dart';

abstract class IMusicRepository {
  Future<Either<Failure, List<MusicTrack>>> getTracksByMood(MoodTag moodTag);
  Future<Either<Failure, List<YouTubeSearchResult>>> searchYouTube(MoodTag moodTag);
}
