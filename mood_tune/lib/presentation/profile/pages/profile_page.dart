import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/state/player_state.dart';
import '../../core/atoms/primary_button.dart';
import '../../../domain/music/entities/music_track.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final photoUrl = user?.photoURL;

    return Scaffold(
      backgroundColor: AppColors.bgMain,
      appBar: AppBar(
        title: Text('Profil', style: AppTextStyles.displayL),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 100),
        child: Column(
          children: [
            const SizedBox(height: 16),

                // Profil Kartı
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow.withValues(alpha: 0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [AppColors.gradientStart, AppColors.gradientEnd],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                          child: ClipOval(
                            child: photoUrl != null
                                ? (photoUrl.startsWith('http')
                                    ? Image.network(
                                        photoUrl,
                                        fit: BoxFit.cover,
                                        errorBuilder: (ctx, e, s) => _defaultAvatar(),
                                      )
                                    : Image.file(
                                        File(photoUrl),
                                        fit: BoxFit.cover,
                                        errorBuilder: (ctx, e, s) => _defaultAvatar(),
                                      ))
                                : _defaultAvatar(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      StreamBuilder<DocumentSnapshot>(
                        stream: user != null
                            ? FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots()
                            : const Stream.empty(),
                        builder: (context, snapshot) {
                          final data = snapshot.data?.data() as Map<String, dynamic>?;
                          String name = data?['displayName'] as String? ?? user?.displayName ?? '';
                          if (name.trim().isEmpty) {
                            name = 'Kullanıcı';
                          }
                          return Text(name, style: AppTextStyles.titleL);
                        },
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => context.push('/edit-profile'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            '✏ Profili Düzenle',
                            style: TextStyle(
                                color: AppColors.primary, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // İstatistik Kartı
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow.withValues(alpha: 0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ValueListenableBuilder<List<Map<String, dynamic>>>(
                        valueListenable: PlayerState.favoritePlaylists,
                        builder: (context, favs, _) {
                          return ValueListenableBuilder<List<Map<String, dynamic>>>(
                            valueListenable: PlayerState.myPlaylists,
                            builder: (context, mine, _) {
                              final total = favs.length + mine.length;
                              return _StatItem(value: total.toString(), label: 'PLAYLİST');
                            },
                          );
                        },
                      ),
                      Container(width: 1, height: 40, color: AppColors.divider),
                      _StatItem(value: '1.4k', label: 'DİNLEME'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Son Dinlenenler
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Son Dinlenenler', style: AppTextStyles.titleL),
                    GestureDetector(
                      onTap: () => _showAllRecentlyPlayed(context),
                      child: Text(
                        'Tümünü Göster',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                ValueListenableBuilder<List<MusicTrack>>(
                  valueListenable: PlayerState.recentTracks,
                  builder: (context, tracks, child) {
                    if (tracks.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Henüz son dinlediğiniz bir şarkı yok.',
                          style: TextStyle(color: AppColors.textHint),
                        ),
                      );
                    }
                    return SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tracks.length,
                        itemBuilder: (context, index) {
                          final track = tracks[index];
                          return GestureDetector(
                            onTap: () {
                              PlayerState.playTrack(
                                track,
                                [track], // Sadece şarkıyı ekle
                                0,
                              );
                            },
                            child: Container(
                              width: 100,
                              margin: const EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: NetworkImage(track.thumbnailUrl),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadow.withValues(alpha: 0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),

                // Favori Şarkılarım
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Favori Şarkılarım', style: AppTextStyles.titleL),
                    GestureDetector(
                      onTap: () => _showAllFavorites(context),
                      child: Text(
                        'Tümünü Göster',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder<List<Map<String, String>>>(
                  valueListenable: PlayerState.favoriteSongs,
                  builder: (context, favorites, child) {
                    if (favorites.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Henüz favori şarkınız yok.',
                          style: TextStyle(color: AppColors.textHint),
                        ),
                      );
                    }
                    return SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: favorites.length,
                        itemBuilder: (context, index) {
                          final song = favorites[index];
                          return Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: NetworkImage(song['image']!),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadow.withValues(alpha: 0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [Colors.black.withValues(alpha: 0.7), Colors.transparent],
                                  ),
                                ),
                                child: Text(
                                  song['title']!,
                                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),

                // Çıkış Yap
                Center(
                  child: SizedBox(
                    width: 200,
                    child: PrimaryButton(
                      text: 'Çıkış Yap',
                      isSolid: true,
                      onPressed: () async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (dialogContext) => AlertDialog(
                        title: const Text('Çıkış Yap'),
                        content: const Text(
                            'Hesabından çıkmak istediğine emin misin?'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(dialogContext, false),
                            child: const Text('Vazgeç'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(dialogContext, true),
                            child: const Text('Çıkış Yap',
                                style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                    if (confirmed == true && context.mounted) {
                      await FirebaseAuth.instance.signOut();
                      if (context.mounted) context.go('/login');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAllRecentlyPlayed(BuildContext context) {
    context.push('/recently-played');
  }

  void _showAllFavorites(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Favori Şarkılarım',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1A2A3A),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.textHint),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ValueListenableBuilder<List<Map<String, String>>>(
                valueListenable: PlayerState.favoriteSongs,
                builder: (context, favorites, child) {
                  if (favorites.isEmpty) {
                    return const Center(
                      child: Text(
                        'Henüz favori şarkınız yok.',
                        style: TextStyle(color: AppColors.textHint),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: favorites.length,
                    itemBuilder: (ctx, i) {
                      final song = favorites[i];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            song['image'] ?? 'https://picsum.photos/200',
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(song['title'] ?? 'Bilinmeyen',
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                        subtitle: Text(song['artist'] ?? 'Bilinmeyen',
                            style: const TextStyle(fontSize: 12, color: AppColors.textHint)),
                        trailing: const Icon(Icons.play_circle_outline, color: AppColors.primary),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _defaultAvatar() {
    return Container(
      color: AppColors.primaryLight,
      child: const Icon(Icons.person, color: AppColors.primary, size: 40),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppTextStyles.displayL),
        Text(label, style: AppTextStyles.label),
      ],
    );
  }
}
