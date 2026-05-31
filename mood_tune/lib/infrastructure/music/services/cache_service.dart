import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/mood/value_objects/mood_tag.dart';
import '../../../domain/music/entities/youtube_search_result.dart';

@lazySingleton
class CacheService {
  final FirebaseFirestore _firestore;

  CacheService(this._firestore);

  static const Duration _cacheTTL = Duration(hours: 1);

  String _moodKey(MoodTag mood) => mood.name;

  /// Cache'den sonuçları döner. Süresi dolmuşsa null döner.
  Future<List<YouTubeSearchResult>?> getCachedResults(MoodTag mood) async {
    try {
      final doc = await _firestore
          .collection('youtube_cache')
          .doc(_moodKey(mood))
          .get();

      if (!doc.exists || doc.data() == null) return null;

      final data = doc.data()!;
      final cachedAt = (data['cachedAt'] as Timestamp?)?.toDate();
      if (cachedAt == null) return null;

      if (DateTime.now().difference(cachedAt) > _cacheTTL) return null;

      final rawList = data['results'] as List<dynamic>?;
      if (rawList == null) return null;

      return rawList
          .map((e) => YouTubeSearchResult.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
    } catch (_) {
      return null;
    }
  }

  /// Arama sonuçlarını Firestore cache'e yazar.
  Future<void> setCachedResults(
    MoodTag mood,
    List<YouTubeSearchResult> results,
  ) async {
    try {
      await _firestore.collection('youtube_cache').doc(_moodKey(mood)).set({
        'moodTag': mood.name,
        'cachedAt': FieldValue.serverTimestamp(),
        'results': results.map((r) => r.toJson()).toList(),
      });
    } catch (_) {
      // Cache yazma hatası kritik değil, sessizce geç
    }
  }

  /// Kullanıcının son çalınan şarkılarını Firestore'dan getirir.
  Future<List<Map<String, dynamic>>?> getRecentlyPlayed() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return null;

      final doc = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('recently_played')
          .doc('tracks')
          .get();

      if (!doc.exists || doc.data() == null) return null;
      
      final data = doc.data()!;
      final rawList = data['results'] as List<dynamic>?;
      if (rawList == null) return null;

      return rawList.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    } catch (_) {
      return null;
    }
  }

  /// Kullanıcının son çalınan şarkılarına yeni bir şarkı ekler (maksimum 15 şarkı).
  Future<void> addRecentlyPlayed(Map<String, dynamic> trackJson) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final docRef = _firestore
          .collection('users')
          .doc(user.uid)
          .collection('recently_played')
          .doc('tracks');

      final doc = await docRef.get();
      List<dynamic> currentList = [];
      if (doc.exists && doc.data() != null) {
        currentList = doc.data()!['results'] as List<dynamic>? ?? [];
      }

      // Şarkı zaten varsa çıkarıp en başa eklemek mantıklıdır
      currentList.removeWhere((item) {
        if (item is Map) {
          return item['id'] == trackJson['id'] || item['youtubeVideoId'] == trackJson['youtubeVideoId'];
        }
        return false;
      });

      // En başa ekle
      currentList.insert(0, trackJson);

      // Limiti koru (örneğin 15)
      if (currentList.length > 15) {
        currentList = currentList.sublist(0, 15);
      }

      await docRef.set({
        'updatedAt': FieldValue.serverTimestamp(),
        'results': currentList,
      });
    } catch (_) {
      // Sessizce geç
    }
  }

  /// Kullanıcının son çalınan şarkılarını temizler.
  Future<void> clearRecentlyPlayed() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('recently_played')
          .doc('tracks')
          .delete();
    } catch (_) {
      // Sessizce geç
    }
  }

  /// Kullanıcının favori listelerini getirir.
  Future<List<Map<String, dynamic>>?> getFavoritePlaylists() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return null;

      final doc = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favorite_playlists')
          .doc('playlists')
          .get();

      if (!doc.exists || doc.data() == null) return null;
      
      final data = doc.data()!;
      final rawList = data['results'] as List<dynamic>?;
      if (rawList == null) return null;

      return rawList.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    } catch (_) {
      return null;
    }
  }

  /// Kullanıcının favori listelerine yeni bir liste ekler.
  Future<void> addFavoritePlaylist(Map<String, dynamic> playlistJson) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final docRef = _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favorite_playlists')
          .doc('playlists');

      final doc = await docRef.get();
      List<dynamic> currentList = [];
      if (doc.exists && doc.data() != null) {
        currentList = doc.data()!['results'] as List<dynamic>? ?? [];
      }

      currentList.removeWhere((item) {
        if (item is Map) {
          return item['playlistId'] == playlistJson['playlistId'];
        }
        return false;
      });

      currentList.insert(0, playlistJson);

      await docRef.set({
        'updatedAt': FieldValue.serverTimestamp(),
        'results': currentList,
      });
    } catch (_) {}
  }

  /// Kullanıcının favori listelerinden bir listeyi çıkarır.
  Future<void> removeFavoritePlaylist(String playlistId) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final docRef = _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favorite_playlists')
          .doc('playlists');

      final doc = await docRef.get();
      if (!doc.exists || doc.data() == null) return;

      List<dynamic> currentList = doc.data()!['results'] as List<dynamic>? ?? [];
      currentList.removeWhere((item) {
        if (item is Map) {
          return item['playlistId'] == playlistId;
        }
        return false;
      });

      await docRef.set({
        'updatedAt': FieldValue.serverTimestamp(),
        'results': currentList,
      });
    } catch (_) {}
  }

  /// Kullanıcının kendi oluşturduğu listeleri getirir.
  Future<List<Map<String, dynamic>>?> getMyPlaylists() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return null;

      final doc = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_playlists')
          .doc('playlists')
          .get();

      if (!doc.exists || doc.data() == null) return [];
      final rawList = doc.data()!['results'] as List<dynamic>? ?? [];
      return rawList.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    } catch (_) {
      return null;
    }
  }

  /// Kullanıcının kendi oluşturduğu listelere yeni liste ekler.
  Future<void> addMyPlaylist(Map<String, dynamic> playlist) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final docRef = _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_playlists')
          .doc('playlists');

      final doc = await docRef.get();
      List<dynamic> currentList = [];
      if (doc.exists && doc.data() != null) {
        currentList = doc.data()!['results'] as List<dynamic>? ?? [];
      }

      currentList.removeWhere((item) {
        if (item is Map) return item['id'] == playlist['id'];
        return false;
      });

      currentList.insert(0, playlist);

      await docRef.set({
        'updatedAt': FieldValue.serverTimestamp(),
        'results': currentList,
      });
    } catch (_) {}
  }

  /// Kullanıcının kendi oluşturduğu listelerden birini çıkarır.
  Future<void> removeMyPlaylist(String id) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final docRef = _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_playlists')
          .doc('playlists');

      final doc = await docRef.get();
      if (!doc.exists || doc.data() == null) return;

      List<dynamic> currentList = doc.data()!['results'] as List<dynamic>? ?? [];
      currentList.removeWhere((item) {
        if (item is Map) {
          return item['id'] == id;
        }
        return false;
      });

      await docRef.set({
        'updatedAt': FieldValue.serverTimestamp(),
        'results': currentList,
      });
    } catch (_) {}
  }

  /// Kullanıcının favori şarkılarını getirir.
  Future<List<Map<String, String>>?> getFavoriteSongs() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return null;

      final doc = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favorite_songs')
          .doc('songs')
          .get();

      if (!doc.exists || doc.data() == null) return [];
      final rawList = doc.data()!['results'] as List<dynamic>? ?? [];
      return rawList
          .map((e) => Map<String, String>.from((e as Map).map(
                (k, v) => MapEntry(k.toString(), v.toString()),
              )))
          .toList();
    } catch (_) {
      return null;
    }
  }

  /// Favori şarkı ekler.
  Future<void> addFavoriteSong(Map<String, String> song) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final docRef = _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favorite_songs')
          .doc('songs');

      final doc = await docRef.get();
      List<dynamic> currentList = [];
      if (doc.exists && doc.data() != null) {
        currentList = doc.data()!['results'] as List<dynamic>? ?? [];
      }
      currentList.removeWhere((item) => (item as Map)['title'] == song['title']);
      currentList.insert(0, song);
      if (currentList.length > 100) currentList = currentList.sublist(0, 100);

      await docRef.set({
        'updatedAt': FieldValue.serverTimestamp(),
        'results': currentList,
      });
    } catch (_) {}
  }

  /// Favori şarkı siler.
  Future<void> removeFavoriteSong(String title) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final docRef = _firestore
          .collection('users')
          .doc(user.uid)
          .collection('favorite_songs')
          .doc('songs');

      final doc = await docRef.get();
      if (!doc.exists || doc.data() == null) return;
      List<dynamic> currentList = doc.data()!['results'] as List<dynamic>? ?? [];
      currentList.removeWhere((item) => (item as Map)['title'] == title);

      await docRef.set({
        'updatedAt': FieldValue.serverTimestamp(),
        'results': currentList,
      });
    } catch (_) {}
  }
}
