import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/mood/value_objects/mood_tag.dart';

part 'music_event.freezed.dart';

@freezed
class MusicEvent with _$MusicEvent {
  const factory MusicEvent.tracksRequestedByMood(MoodTag mood) = _TracksRequestedByMood;
  const factory MusicEvent.youtubeSearchRequested(String query) = _YoutubeSearchRequested;
}
