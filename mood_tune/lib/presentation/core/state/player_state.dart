import 'package:flutter/foundation.dart';

class PlayerState {
  static final isPlaying = ValueNotifier<bool>(false);
  static final favoriteSongs = ValueNotifier<List<Map<String, String>>>([]);

  static void togglePlay() {
    isPlaying.value = !isPlaying.value;
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
