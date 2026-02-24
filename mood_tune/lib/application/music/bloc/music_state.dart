import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/music/entities/music_track.dart';
import '../../../domain/core/failures/failure.dart';
import '../../../domain/music/entities/youtube_search_result.dart';

part 'music_state.freezed.dart';

@freezed
class MusicState with _$MusicState {
  const factory MusicState.initial() = _Initial;
  const factory MusicState.loading() = _Loading;
  const factory MusicState.tracksLoaded(List<MusicTrack> tracks) = _TracksLoaded;
  const factory MusicState.searchResultsLoaded(List<YouTubeSearchResult> results) = _SearchResultsLoaded;
  const factory MusicState.failure(Failure failure) = _Failure;
}
