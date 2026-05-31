import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/mood/value_objects/mood_tag.dart';
import '../../../domain/music/entities/music_track.dart';

part 'music_event.freezed.dart';

@freezed
class MusicEvent with _$MusicEvent {
  const factory MusicEvent.tracksRequestedByMood(MoodTag mood) = _TracksRequestedByMood;
  const factory MusicEvent.tracksRequestedByMoodName(String moodName) = _TracksRequestedByMoodName;
  const factory MusicEvent.youtubeSearchRequested(String query) = _YoutubeSearchRequested;
  const factory MusicEvent.recentlyPlayedRequested() = _RecentlyPlayedRequested;
  const factory MusicEvent.recentlyPlayedCleared() = _RecentlyPlayedCleared;
  const factory MusicEvent.playlistRequested(String playlistId) = _PlaylistRequested;
  const factory MusicEvent.trackPlayed(MusicTrack track) = _TrackPlayed;
}
