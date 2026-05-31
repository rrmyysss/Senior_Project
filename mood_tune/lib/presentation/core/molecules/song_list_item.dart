import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SongListItem extends StatelessWidget {
  final String title;
  final String artist;
  final String imageUrl;
  final bool isPlaying;
  final VoidCallback onTap;
  final VoidCallback onTrailingTap;
  final bool isFavorite;

  const SongListItem({
    super.key,
    required this.title,
    required this.artist,
    required this.imageUrl,
    this.isPlaying = false,
    required this.onTap,
    required this.onTrailingTap,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: isPlaying 
            ? LinearGradient(
                colors: [AppColors.primary.withValues(alpha: 0.1), Colors.transparent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
          border: isPlaying ? const Border(left: BorderSide(color: AppColors.primary, width: 4)) : null,
          color: isPlaying ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Resim
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 50,
                  height: 50,
                  color: AppColors.divider,
                  child: const Icon(Icons.music_note, color: AppColors.textHint),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Detaylar
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.titleM.copyWith(
                      color: isPlaying ? AppColors.primary : AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    artist,
                    style: AppTextStyles.bodyM,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Aksiyon
            IconButton(
              icon: Icon(
                isPlaying ? (isFavorite ? Icons.favorite : Icons.favorite_border) : Icons.more_vert,
                color: isPlaying ? AppColors.primary : AppColors.textHint,
              ),
              onPressed: onTrailingTap,
            ),
          ],
        ),
      ),
    );
  }
}
