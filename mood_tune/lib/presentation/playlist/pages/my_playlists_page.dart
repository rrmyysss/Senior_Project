import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/molecules/playlist_card.dart';
import '../../core/organisms/custom_bottom_nav_bar.dart';

class MyPlaylistsPage extends StatefulWidget {
  const MyPlaylistsPage({super.key});

  @override
  State<MyPlaylistsPage> createState() => _MyPlaylistsPageState();
}

class _MyPlaylistsPageState extends State<MyPlaylistsPage> {
  final List<Map<String, dynamic>> _playlists = List.generate(6, (index) => {
    'title': 'Çalışma Listesi $index',
    'imageUrl': 'https://picsum.photos/seed/my$index/200',
    'mood': 'odak',
    'songCount': 12 + index,
  });

  Future<void> _confirmDelete(BuildContext context, int index) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Playlistı Sil', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text(
          '"${_playlists[index]['title']}" adlı playlistı silmek istediğinize emin misiniz?',
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
      setState(() => _playlists.removeAt(index));
    }
  }

  void _showPlaylistDetail(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Color(0xFFEDF2F9),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _playlists[index]['title'] as String,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1A2A3A),
                      ),
                    ),
                  ),
                  // Silme Butonu
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red, size: 26),
                    onPressed: () {
                      Navigator.pop(context);
                      _confirmDelete(context, index);
                    },
                  ),
                ],
              ),
            ),
            const Divider(height: 24),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _playlists[index]['songCount'] as int,
                itemBuilder: (ctx, i) => ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.music_note, color: AppColors.primary, size: 20),
                  ),
                  title: Text('Şarkı ${i + 1}', style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: const Text('Sanatçı', style: TextStyle(color: AppColors.textHint, fontSize: 12)),
                  trailing: const Icon(Icons.play_circle_outline, color: AppColors.primary),
                ),
              ),
            ),
          ],
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
              Tab(text: 'Tümü'),
              Tab(text: 'Benim Oluşturduklarım'),
            ],
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                _buildGrid(context),
                _buildGrid(context),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: CustomBottomNavBar(
                currentIndex: 2,
                onTap: (index) {
                  if (index == 0) context.go('/home');
                  if (index == 1) context.pushReplacement('/choose-mood');
                  if (index == 3) context.pushReplacement('/profile');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 100),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: _playlists.length,
      itemBuilder: (context, index) {
        final pl = _playlists[index];
        return PlaylistCard(
          title: pl['title'] as String,
          imageUrl: pl['imageUrl'] as String,
          moodName: pl['mood'] as String,
          songCount: pl['songCount'] as int,
          onTap: () => _showPlaylistDetail(context, index),
          onMenuTap: () => _confirmDelete(context, index),
        );
      },
    );
  }
}
