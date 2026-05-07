import 'package:flutter/material.dart';
import '../../core/atoms/glass_container.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../state/player_state.dart';

class GlobalMiniPlayer extends StatelessWidget {
  const GlobalMiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16, // floating above the bottom nav (bottom nav is ~60-80px, it's inside the body stack so it's 16 from bottom of body)
      left: 16,
      right: 16,
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
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17'),
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
                    'Midnight City',
                    style: AppTextStyles.bodyM.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'M83',
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
                final isFavorite = PlayerState.isFavorite('Midnight City');
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? AppColors.primary : AppColors.textHint,
                    size: 24,
                  ),
                  onPressed: () {
                    PlayerState.toggleFavorite(
                      'Midnight City',
                      'M83',
                      'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17',
                    );
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
    );
  }
}
