import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/mood/repositories/i_mood_repository.dart';
import 'mood_event.dart';
import 'mood_state.dart';

@injectable
class MoodBloc extends Bloc<MoodEvent, MoodState> {
  final IMoodRepository _moodRepository;

  MoodBloc(this._moodRepository) : super(const MoodState.initial()) {
    on<MoodEvent>((event, emit) async {
      await event.map(
        historyRequested: (e) async {
          emit(const MoodState.loading());
          final failureOrEntries = await _moodRepository.getHistory(e.userId);
          emit(
            failureOrEntries.fold(
              (f) => MoodState.failure(f),
              (entries) => MoodState.historyLoaded(entries),
            ),
          );
        },
        entryAdded: (e) async {
          emit(const MoodState.loading());
          final failureOrId = await _moodRepository.addEntry(e.entry);
          emit(
            failureOrId.fold(
              (f) => MoodState.failure(f),
              (id) => const MoodState.operationSuccess('Entry added successfully.'),
            ),
          );
          // Auto-refresh history
          add(MoodEvent.historyRequested(e.entry.userId));
        },
        entryDeleted: (e) async {
          emit(const MoodState.loading());
          final failureOrUnit = await _moodRepository.deleteEntry(e.entryId, e.userId);
          emit(
            failureOrUnit.fold(
              (f) => MoodState.failure(f),
              (_) => const MoodState.operationSuccess('Entry deleted successfully.'),
            ),
          );
           // Auto-refresh history
          add(MoodEvent.historyRequested(e.userId));
        },
      );
    });
  }
}
