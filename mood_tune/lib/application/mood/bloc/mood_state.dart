import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/mood/entities/mood_entry.dart';
import '../../../domain/core/failures/failure.dart';

part 'mood_state.freezed.dart';

@freezed
class MoodState with _$MoodState {
  const factory MoodState.initial() = _Initial;
  const factory MoodState.loading() = _Loading;
  const factory MoodState.historyLoaded(List<MoodEntry> entries) = _HistoryLoaded;
  const factory MoodState.operationSuccess(String message) = _OperationSuccess;
  const factory MoodState.failure(Failure failure) = _Failure;
}
