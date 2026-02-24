import 'package:fpdart/fpdart.dart';
import '../../core/failures/failure.dart';
import '../entities/music_track.dart';
import '../entities/youtube_search_result.dart';
import '../../mood/value_objects/mood_tag.dart';

abstract class IYouTubeRepository {
  Future<Either<Failure, List<YouTubeSearchResult>>> searchByMood({required MoodTag moodTag, required String query});
  Future<Either<Failure, Map<String, dynamic>>> getVideoDetails(String videoId);
  MusicTrack convertToTrack(YouTubeSearchResult result, MoodTag moodTag);
}
