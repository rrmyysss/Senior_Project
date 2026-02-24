import 'package:freezed_annotation/freezed_annotation.dart';

enum MoodMethod {
  @JsonValue('camera')
  camera,
  @JsonValue('manual')
  manual,
}
