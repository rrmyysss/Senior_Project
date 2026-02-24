import 'package:freezed_annotation/freezed_annotation.dart';

enum MoodTag {
  @JsonValue('Happy')
  happy,
  @JsonValue('Sad')
  sad,
  @JsonValue('Angry')
  angry,
  @JsonValue('Fear')
  fear,
  @JsonValue('Surprise')
  surprise,
  @JsonValue('Neutral')
  neutral,
}
