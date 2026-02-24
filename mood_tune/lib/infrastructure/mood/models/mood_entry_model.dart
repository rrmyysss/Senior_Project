import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/mood/entities/mood_entry.dart';
import '../../../../domain/mood/value_objects/mood_tag.dart';
import '../../../../domain/mood/value_objects/mood_method.dart';

part 'mood_entry_model.freezed.dart';
part 'mood_entry_model.g.dart';

@freezed
class MoodEntryModel with _$MoodEntryModel {
  const MoodEntryModel._();

  const factory MoodEntryModel({
    required String id,
    required String userId,
    required String moodTag,
    required String method,
    double? confidence,
    String? note,
    required String timestamp,
    @Default([]) List<String> tracksPlayed,
    int? sessionDuration,
  }) = _MoodEntryModel;

  factory MoodEntryModel.fromJson(Map<String, dynamic> json) =>
      _$MoodEntryModelFromJson(json);

  factory MoodEntryModel.fromDomain(MoodEntry entry) {
    return MoodEntryModel(
      id: entry.id,
      userId: entry.userId,
      moodTag: entry.moodTag.name,
      method: entry.method.name,
      confidence: entry.confidence,
      note: entry.note,
      timestamp: entry.timestamp.toIso8601String(),
      tracksPlayed: entry.tracksPlayed,
      sessionDuration: entry.sessionDuration,
    );
  }

  MoodEntry toDomain() {
    return MoodEntry(
      id: id,
      userId: userId,
      moodTag: MoodTag.values.firstWhere(
        (e) => e.name == moodTag,
        orElse: () => MoodTag.neutral,
      ),
      method: MoodMethod.values.firstWhere(
        (e) => e.name == method,
        orElse: () => MoodMethod.manual,
      ),
      confidence: confidence,
      note: note,
      timestamp: DateTime.parse(timestamp),
      tracksPlayed: tracksPlayed,
      sessionDuration: sessionDuration,
    );
  }
}
