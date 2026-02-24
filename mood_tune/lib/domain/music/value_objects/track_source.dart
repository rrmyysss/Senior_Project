import 'package:freezed_annotation/freezed_annotation.dart';

enum TrackSource {
  @JsonValue('manual')
  manual,
  @JsonValue('youtube_api')
  youtubeApi,
}
