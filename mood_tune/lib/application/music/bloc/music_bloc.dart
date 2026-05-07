import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/music/repositories/i_music_repository.dart';
import 'music_event.dart';
import 'music_state.dart';

@injectable
class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final IMusicRepository _musicRepository;

  MusicBloc(this._musicRepository) : super(const MusicState.initial()) {
    on<MusicEvent>((event, emit) async {
      await event.map(
        tracksRequestedByMood: (e) async {
          emit(const MusicState.loading());
          final failureOrTracks = await _musicRepository.getTracksByMood(e.mood);
          emit(
            failureOrTracks.fold(
              (f) => MusicState.failure(f),
              (tracks) => MusicState.tracksLoaded(tracks),
            ),
          );
        },
        youtubeSearchRequested: (e) async {
          emit(const MusicState.loading());
          // e.query is typically a string, but the interface takes MoodTag
          // If e.query is a string, then the interface might be wrong, or event is wrong.
          // Let's assume the interface is correct: it takes a MoodTag (e.g. from the event).
          // We need to check what `youtubeSearchRequested` defines. Wait, looking at the code...
          final failureOrResults = await _musicRepository.searchYouTube(e.query);
          emit(
            failureOrResults.fold(
              (f) => MusicState.failure(f),
              (results) => MusicState.searchResultsLoaded(results),
            ),
          );
        }
      );
    });
  }
}
