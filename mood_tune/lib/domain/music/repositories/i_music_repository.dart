import 'package:fpdart/fpdart.dart';
import '../../core/failures/failure.dart';
import '../entities/music_track.dart';
import '../../mood/value_objects/mood_tag.dart';
import '../entities/youtube_search_result.dart';

abstract class IMusicRepository {
  Future<Either<Failure, List<MusicTrack>>> getTracksByMood(MoodTag moodTag);
  Future<Either<Failure, List<MusicTrack>>> getTracksByMoodName(String moodName);
  Future<Either<Failure, List<YouTubeSearchResult>>> searchYouTube(String query);
  
  Future<Either<Failure, List<MusicTrack>>> getRecentlyPlayedTracks();
  Future<Either<Failure, Unit>> addTrackToRecentlyPlayed(MusicTrack track);
  Future<Either<Failure, Unit>> clearRecentlyPlayed();
  Future<Either<Failure, List<MusicTrack>>> getPlaylistTracks(String playlistId);
  Future<Either<Failure, List<Map<String, dynamic>>>> getFavoritePlaylists();
  Future<Either<Failure, Unit>> addFavoritePlaylist(Map<String, dynamic> playlist);
  Future<Either<Failure, Unit>> removeFavoritePlaylist(String playlistId);

  Future<Either<Failure, List<Map<String, dynamic>>>> getMyPlaylists();
  Future<Either<Failure, Unit>> addMyPlaylist(Map<String, dynamic> playlist);
  Future<Either<Failure, Unit>> removeMyPlaylist(String id);

  Future<Either<Failure, List<Map<String, String>>>> getFavoriteSongs();
  Future<Either<Failure, Unit>> addFavoriteSong(Map<String, String> song);
  Future<Either<Failure, Unit>> removeFavoriteSong(String title);
}
