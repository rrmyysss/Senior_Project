import 'package:flutter/foundation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../domain/music/entities/music_track.dart';

class PlayerState {
  static final isPlaying = ValueNotifier<bool>(false);
  static final favoriteSongs = ValueNotifier<List<Map<String, String>>>([]);
  static final currentTrack = ValueNotifier<MusicTrack?>(null);
  static final currentPlaylist = ValueNotifier<List<MusicTrack>>([]);
  static final currentIndex = ValueNotifier<int>(0);
  static final isFullPlayerVisible = ValueNotifier<bool>(false);
  static final isMiniPlayerVisible = ValueNotifier<bool>(true);
  static final recentTracks = ValueNotifier<List<MusicTrack>>([]);
  static final favoritePlaylists = ValueNotifier<List<Map<String, dynamic>>>([]);
  static final myPlaylists = ValueNotifier<List<Map<String, dynamic>>>([]);

  // YouTube controller referansı — MainScaffold tarafından set edilir
  static YoutubePlayerController? _ytController;

  static void setController(YoutubePlayerController controller) {
    _ytController = controller;
  }

  static void updateRecentTracks(List<MusicTrack> tracks) {
    recentTracks.value = tracks;
  }

  static void playTrack(MusicTrack track, List<MusicTrack> playlist, int index) {
    currentTrack.value = track;
    currentPlaylist.value = playlist;
    currentIndex.value = index;
    isFullPlayerVisible.value = true;
  }

  static void togglePlay() {
    if (_ytController == null) return;
    final ctrl = _ytController!;
    if (ctrl.value.isPlaying) {
      ctrl.pause();
      isPlaying.value = false;
    } else {
      ctrl.play();
      isPlaying.value = true;
    }
  }

  static void toggleFavorite(String title, String artist, String image) {
    final list = List<Map<String, String>>.from(favoriteSongs.value);
    final existsIndex = list.indexWhere((s) => s['title'] == title);
    if (existsIndex >= 0) {
      list.removeAt(existsIndex);
    } else {
      list.add({
        'title': title,
        'artist': artist,
        'image': image,
      });
    }
    favoriteSongs.value = list;
  }
  
  static bool isFavorite(String title) {
    return favoriteSongs.value.any((s) => s['title'] == title);
  }
}
