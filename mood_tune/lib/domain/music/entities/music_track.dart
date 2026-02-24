import 'package:freezed_annotation/freezed_annotation.dart';
import '../../mood/value_objects/mood_tag.dart';
import '../value_objects/track_source.dart';

part 'music_track.freezed.dart';
part 'music_track.g.dart';

@freezed
class MusicTrack with _$MusicTrack {
  const factory MusicTrack({
    required String id,
    required String title,
    required String artist,
    required String youtubeVideoId,
    required String youtubeUrl,
    required String thumbnailUrl,
    required String channelName,
    required MoodTag moodTag,
    required TrackSource source,
    String? genre,
    int? durationMs,
    String? previewUrl,
    int? popularity,
  }) = _MusicTrack;

  factory MusicTrack.fromJson(Map<String, dynamic> json) =>
      _$MusicTrackFromJson(json);
}
