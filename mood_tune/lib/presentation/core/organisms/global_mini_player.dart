import 'package:flutter/material.dart';
import '../../core/atoms/glass_container.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../state/player_state.dart';
import '../../../domain/music/entities/music_track.dart';
import '../../../domain/music/repositories/i_music_repository.dart';
import '../../../injection.dart';

class GlobalMiniPlayer extends StatelessWidget {
  const GlobalMiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<MusicTrack?>(
      valueListenable: PlayerState.currentTrack,
      builder: (context, track, child) {
        if (track == null) return const SizedBox.shrink();

        return ValueListenableBuilder<bool>(
          valueListenable: PlayerState.isMiniPlayerVisible,
          builder: (context, isVisible, child) {
            if (!isVisible) return const SizedBox.shrink();

            return Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: GestureDetector(
                onTap: () {
                  PlayerState.isFullPlayerVisible.value = true;
                },
                child: GlassContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  borderRadius: 20,
                  opacity: 0.7,
                  blur: 16,
                  child: Row(
                    children: [
                      // Album Art
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadow.withValues(alpha: 0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                          ],
                          image: DecorationImage(
                            image: NetworkImage(track.thumbnailUrl.isNotEmpty 
                                ? track.thumbnailUrl 
                                : 'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Infos
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              track.title,
                              style: AppTextStyles.bodyM.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w800,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              track.artist,
                              style: AppTextStyles.label.copyWith(color: AppColors.textSecondary),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      // Actions
                      ValueListenableBuilder<List<Map<String, String>>>(
                        valueListenable: PlayerState.favoriteSongs,
                        builder: (context, favorites, child) {
                          final isFavorite = favorites.any((s) => s['title'] == track.title);
                          return IconButton(
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? AppColors.primary : AppColors.textHint,
                              size: 24,
                            ),
                            onPressed: () async {
                              final repo = getIt<IMusicRepository>();
                              if (isFavorite) {
                                await repo.removeFavoriteSong(track.title);
                              } else {
                                await repo.addFavoriteSong({
                                  'title': track.title,
                                  'artist': track.artist,
                                  'image': track.thumbnailUrl.isNotEmpty
                                      ? track.thumbnailUrl
                                      : 'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17',
                                });
                              }
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      ValueListenableBuilder<bool>(
                        valueListenable: PlayerState.isPlaying,
                        builder: (context, isPlaying, child) {
                          return GestureDetector(
                            onTap: PlayerState.togglePlay,
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [AppColors.gradientStart, AppColors.gradientEnd],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
