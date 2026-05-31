import 'dart:io';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../atoms/mood_tag_badge.dart';

class PlaylistCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String moodName;
  final int songCount;
  final VoidCallback onTap;
  final VoidCallback onMenuTap;

  const PlaylistCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.moodName,
    required this.songCount,
    required this.onTap,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow.withValues(alpha: 0.15),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Arka plan resmi
              if (imageUrl.isNotEmpty && !imageUrl.startsWith('http'))
                Image.file(
                  File(imageUrl),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.textHint,
                    child: const Icon(Icons.music_note, color: Colors.white, size: 40),
                  ),
                )
              else
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.textHint,
                    child: const Icon(Icons.music_note, color: Colors.white, size: 40),
                  ),
                ),
              // Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.8),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.0, 0.7],
                  ),
                ),
              ),
              // Menu Butonu
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: onMenuTap,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.more_horiz, size: 20, color: Colors.white),
                  ),
                ),
              ),
              // İçerik (Alt kısım)
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleL.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '$songCount Şarkı',
                          style: AppTextStyles.label.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
