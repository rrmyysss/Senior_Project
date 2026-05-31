import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class TrackControlBar extends StatelessWidget {
  final Duration currentPosition;
  final Duration totalDuration;
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final VoidCallback onShuffle;
  final VoidCallback onRepeat;
  final bool isShuffleEnabled;
  final bool isRepeatEnabled;
  final ValueChanged<double> onSeek;

  const TrackControlBar({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onNext,
    required this.onPrevious,
    required this.onShuffle,
    required this.onRepeat,
    this.isShuffleEnabled = false,
    this.isRepeatEnabled = false,
    required this.onSeek,
  });

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // İlerleme Çubuğu ve Süreler
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.primaryLight,
            thumbColor: AppColors.primary,
            trackHeight: 4.0,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
          ),
          child: Slider(
            value: currentPosition.inSeconds.toDouble().clamp(0, totalDuration.inSeconds.toDouble()),
            min: 0,
            max: totalDuration.inSeconds.toDouble() > 0 ? totalDuration.inSeconds.toDouble() : 1,
            onChanged: onSeek,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formatDuration(currentPosition), style: AppTextStyles.label.copyWith(fontSize: 12)),
              Text(_formatDuration(totalDuration), style: AppTextStyles.label.copyWith(fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Kontrol Butonları
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.shuffle,
                color: isShuffleEnabled ? AppColors.primary : AppColors.textHint,
                size: 24,
              ),
              onPressed: onShuffle,
            ),
            IconButton(
              icon: const Icon(Icons.skip_previous, size: 36, color: AppColors.textPrimary),
              onPressed: onPrevious,
            ),
            GestureDetector(
              onTap: onPlayPause,
              child: Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.skip_next, size: 36, color: AppColors.textPrimary),
              onPressed: onNext,
            ),
            IconButton(
              icon: Icon(
                Icons.repeat,
                color: isRepeatEnabled ? AppColors.primary : AppColors.textHint,
                size: 24,
              ),
              onPressed: onRepeat,
            ),
          ],
        ),
      ],
    );
  }
}
