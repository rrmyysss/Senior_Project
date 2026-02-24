import 'package:freezed_annotation/freezed_annotation.dart';
import '../value_objects/mood_tag.dart';
import '../value_objects/mood_method.dart';

part 'mood_entry.freezed.dart';
part 'mood_entry.g.dart';

@freezed
class MoodEntry with _$MoodEntry {
  const factory MoodEntry({
    required String id,
    required String userId,
    required MoodTag moodTag,
    required MoodMethod method,
    double? confidence,
    String? note,
    required DateTime timestamp,
    @Default([]) List<String> tracksPlayed,
    int? sessionDuration,
  }) = _MoodEntry;

  factory MoodEntry.fromJson(Map<String, dynamic> json) =>
      _$MoodEntryFromJson(json);
}
