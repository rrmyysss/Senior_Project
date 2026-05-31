import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/molecules/playlist_card.dart';
import '../../core/state/player_state.dart';
import '../../../injection.dart';
import '../../../domain/music/repositories/i_music_repository.dart';

class MyPlaylistsPage extends StatefulWidget {
  const MyPlaylistsPage({super.key});

  @override
  State<MyPlaylistsPage> createState() => _MyPlaylistsPageState();
}

class _MyPlaylistsPageState extends State<MyPlaylistsPage> {
  // favoritePlaylists artık PlayerState üzerinden yönetiliyor

  Future<void> _confirmDelete(BuildContext context, int index, List<Map<String, dynamic>> playlists, {bool isMyPlaylist = false}) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(isMyPlaylist ? 'Listeyi Sil' : 'Favoriden Çıkar', style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Text(
          isMyPlaylist 
            ? '"${playlists[index]['title']}" listesini silmek istediğinize emin misiniz?'
            : '"${playlists[index]['title']}" listesini favorilerden çıkarmak istediğinize emin misiniz?',
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Vazgeç'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Sil', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      if (isMyPlaylist) {
        final repo = getIt<IMusicRepository>();
        await repo.removeMyPlaylist(playlists[index]['id'] as String);
      } else {
        final repo = getIt<IMusicRepository>();
        await repo.removeFavoritePlaylist(playlists[index]['playlistId'] as String);
      }
    }
  }

  void _showMenuOptions(BuildContext context, int index, List<Map<String, dynamic>> playlists, {required bool isMyPlaylist}) {
    if (!isMyPlaylist) {
      _confirmDelete(context, index, playlists, isMyPlaylist: false);
      return;
    }

    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit, color: AppColors.primary),
                title: const Text('Düzenle'),
                onTap: () {
                  Navigator.pop(ctx);
                  context.push('/new-playlist', extra: playlists[index]);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Sil', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(ctx);
                  _confirmDelete(context, index, playlists, isMyPlaylist: true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.bgMain,
        appBar: AppBar(
          title: Text('Kitaplığım', style: AppTextStyles.displayL),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.add, color: AppColors.primary, size: 32),
              onPressed: () => context.push('/new-playlist'),
            ),
            const SizedBox(width: 16),
          ],
          bottom: const TabBar(
            indicatorColor: AppColors.primary,
            indicatorWeight: 3,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textHint,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Nunito'),
            unselectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Nunito'),
            tabs: [
              Tab(text: 'Favoriler'),
              Tab(text: 'Benim Oluşturduklarım'),
            ],
          ),
        ),
        body: ValueListenableBuilder<List<Map<String, dynamic>>>(
          valueListenable: PlayerState.favoritePlaylists,
          builder: (context, favPlaylists, _) {
            return ValueListenableBuilder<List<Map<String, dynamic>>>(
              valueListenable: PlayerState.myPlaylists,
              builder: (context, myPlaylists, _) {
                return TabBarView(
                  children: [
                    _buildGrid(context, favPlaylists, isMyPlaylists: false),
                    myPlaylists.isEmpty 
                      ? _buildMyCreatedEmpty(context) 
                      : _buildGrid(context, myPlaylists, isMyPlaylists: true),
                  ],
                );
              }
            );
          },
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, List<Map<String, dynamic>> playlists, {bool isMyPlaylists = false}) {
    if (playlists.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.library_music_outlined, size: 64, color: AppColors.textHint),
            const SizedBox(height: 16),
            const Text(
              'Henüz favori listeniz yok',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Bir playlist açıp ❤️ butonuna basın',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textHint,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 100),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        final pl = playlists[index];
        return PlaylistCard(
          title: pl['title'] as String? ?? '',
          imageUrl: pl['thumbnailUrl'] as String? ?? '',
          moodName: isMyPlaylists ? (pl['emoji'] as String? ?? '') : (pl['mood'] as String? ?? ''),
          songCount: pl['songCount'] as int? ?? 0,
          onTap: () {
            if (isMyPlaylists) {
              context.push('/local-playlist', extra: {
                'title': pl['title'],
                'mood': pl['emoji'],
                'songs': pl['songs'],
              });
            } else {
              context.push('/youtube-playlist', extra: {
                'playlistId': pl['playlistId'],
                'title': pl['title'],
                'mood': pl['mood'],
                'thumbnailUrl': pl['thumbnailUrl'],
              });
            }
          },
          onMenuTap: () => _showMenuOptions(context, index, playlists, isMyPlaylist: isMyPlaylists),
        );
      },
    );
  }

  Widget _buildMyCreatedEmpty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_circle_outline, size: 64, color: AppColors.textHint),
          const SizedBox(height: 16),
          const Text(
            'Henüz playlist oluşturmadınız',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sağ üstteki + butonuyla yeni liste oluşturabilirsiniz',
            style: TextStyle(fontSize: 13, color: AppColors.textHint),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
