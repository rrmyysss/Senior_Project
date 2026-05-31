import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/mood/entities/mood_entry.dart';

part 'mood_event.freezed.dart';

@freezed
class MoodEvent with _$MoodEvent {
  const factory MoodEvent.historyRequested(String userId) = _HistoryRequested;
  const factory MoodEvent.entryAdded(MoodEntry entry) = _EntryAdded;
  const factory MoodEvent.entryDeleted(String entryId, String userId) = _EntryDeleted;
}
