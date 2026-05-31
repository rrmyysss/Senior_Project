import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/molecules/playlist_list_item.dart';
import '../../core/organisms/custom_bottom_nav_bar.dart';
import '../../core/molecules/mini_player.dart';
import '../../core/atoms/app_text_field.dart';
import '../../core/atoms/glass_container.dart';
import '../../core/state/player_state.dart';

class ChoosePlaylistPage extends StatefulWidget {
  const ChoosePlaylistPage({super.key});

  @override
  State<ChoosePlaylistPage> createState() => _ChoosePlaylistPageState();
}

class _ChoosePlaylistPageState extends State<ChoosePlaylistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      appBar: AppBar(
        title: Text('Playlist Seç', style: AppTextStyles.displayL),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 200),
            child: Column(
              children: [
                const SizedBox(height: 16),
                
                // Arama
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow.withValues(alpha: 0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const AppTextField(
                    hintText: 'Playlist ara...',
                    prefixIcon: Icon(Icons.search, color: AppColors.primary),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Liste
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return PlaylistListItem(
                      title: 'Odak Modu $index',
                      imageUrl: 'https://picsum.photos/seed/p$index/100',
                      moodName: 'odak',
                      subtitle: 'Küratör: MoodTune • ⏱ 45 dk',
                      showPlayIcon: true,
                      onTap: () {
                        // Dummy click
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          
          // MiniPlayer ve NavBar konteynerı
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MiniPlayer(
                  title: 'Örnek Şarkı',
                  artist: 'Örnek Sanatçı',
                  imageUrl: 'https://picsum.photos/seed/m1/100',
                  isPlaying: true,
                  onPlayPause: () {},
                  onNext: () {},
                  onPrevious: () {},
                  onFavorite: () {},
                  onTap: () {
                    PlayerState.isFullPlayerVisible.value = true;
                  },
                ),
                CustomBottomNavBar(
                  currentIndex: 2, // Playlist aktif
                  onTap: (index) {
                    if (index == 0) context.go('/home');
                    if (index == 1) context.pushReplacement('/choose-mood');
                    if (index == 3) context.pushReplacement('/profile');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
