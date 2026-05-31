import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/music/entities/music_track.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/state/player_state.dart';

class NextMusicsPage extends StatelessWidget {
  final List<MusicTrack> tracks;
  final int currentIndex;

  const NextMusicsPage({
    super.key,
    required this.tracks,
    this.currentIndex = 0,
  });

  /// ISO 8601 süreyi mm:ss formatına çevirir
  String _formatDuration(int? durationMs) {
    if (durationMs == null || durationMs == 0) return '--:--';
    final total = durationMs ~/ 1000;
    final minutes = total ~/ 60;
    final seconds = total % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      appBar: AppBar(
        title: Column(
          children: [
            Text('Şu Anki Playlist', style: AppTextStyles.titleL),
            Text(
              '${tracks.length} parça',
              style: AppTextStyles.label.copyWith(color: AppColors.primary),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textPrimary,
            size: 32,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: tracks.isEmpty
          ? const Center(child: Text('Şarkı bulunamadı'))
          : ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                final track = tracks[index];
                final isPlaying = index == currentIndex;

                return GestureDetector(
                  onTap: () {
                    // Seçilen şarkıya git
                    PlayerState.playTrack(
                      track,
                      tracks,
                      index,
                    );
                    context.pop(); // Sırada sayfasını kapat
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isPlaying
                          ? AppColors.primary.withValues(alpha: 0.08)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: isPlaying
                          ? Border.all(
                              color: AppColors.primary.withValues(alpha: 0.3))
                          : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Sıra numarası veya equalizer
                        SizedBox(
                          width: 36,
                          child: isPlaying
                              ? Icon(Icons.equalizer,
                                  color: AppColors.primary, size: 22)
                              : Text(
                                  '${index + 1}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                        ),
                        const SizedBox(width: 10),
                        // Thumbnail
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: track.thumbnailUrl,
                            width: 52,
                            height: 52,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, _) => Container(
                              width: 52,
                              height: 52,
                              color: AppColors.primary.withValues(alpha: 0.1),
                              child: const Icon(Icons.music_note,
                                  color: AppColors.primary),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Başlık & Kanal
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                track.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: isPlaying
                                      ? FontWeight.w800
                                      : FontWeight.w600,
                                  color: isPlaying
                                      ? AppColors.primary
                                      : AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                track.channelName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Süre
                        Text(
                          _formatDuration(track.durationMs),
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textHint,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
