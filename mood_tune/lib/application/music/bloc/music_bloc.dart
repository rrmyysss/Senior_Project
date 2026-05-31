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
        tracksRequestedByMoodName: (e) async {
          emit(const MusicState.loading());
          final failureOrTracks =
              await _musicRepository.getTracksByMoodName(e.moodName);
          emit(
            failureOrTracks.fold(
              (f) => MusicState.failure(f),
              (tracks) => MusicState.tracksLoaded(tracks),
            ),
          );
        },
        youtubeSearchRequested: (e) async {
          emit(const MusicState.loading());
          final failureOrResults = await _musicRepository.searchYouTube(e.query);
          emit(
            failureOrResults.fold(
              (f) => MusicState.failure(f),
              (results) => MusicState.searchResultsLoaded(results),
            ),
          );
        },
        recentlyPlayedRequested: (e) async {
          emit(const MusicState.loading());
          final failureOrTracks = await _musicRepository.getRecentlyPlayedTracks();
          emit(
            failureOrTracks.fold(
              (f) => MusicState.failure(f),
              (tracks) => MusicState.recentlyPlayedLoaded(tracks),
            ),
          );
        },
        trackPlayed: (e) async {
          // Track played event'inde state'i loading'e çekmeye gerek yok,
          // sadece arkaplanda repository üzerinden cache'e ekleme yapalım.
          await _musicRepository.addTrackToRecentlyPlayed(e.track);
        },
        recentlyPlayedCleared: (e) async {
          emit(const MusicState.loading());
          await _musicRepository.clearRecentlyPlayed();
          emit(const MusicState.recentlyPlayedLoaded([]));
        },
        playlistRequested: (e) async {
          emit(const MusicState.loading());
          final failureOrTracks = await _musicRepository.getPlaylistTracks(e.playlistId);
          emit(
            failureOrTracks.fold(
              (f) => MusicState.failure(f),
              (tracks) => MusicState.playlistLoaded(tracks),
            ),
          );
        },
      );
    });
  }
}
