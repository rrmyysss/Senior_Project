import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/molecules/track_control_bar.dart';

class PlayMusicPage extends StatefulWidget {
  const PlayMusicPage({super.key});

  @override
  State<PlayMusicPage> createState() => _PlayMusicPageState();
}

class _PlayMusicPageState extends State<PlayMusicPage> {
  bool _isPlaying = true;
  double _sliderValue = 30.0;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.textHint, size: 32),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          children: [
            Text('ŞU AN ÇALIYOR', style: AppTextStyles.label.copyWith(fontSize: 10, letterSpacing: 1.2)),
            Text('MoodTune Tavsiyesi', style: AppTextStyles.label),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Kapak
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      blurRadius: 40,
                      offset: const Offset(0, 20),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://picsum.photos/seed/cover/400',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width - 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Başlık ve Sanatçı
              Column(
                children: [
                   Text(
                    'Sabah Işığı',
                    style: AppTextStyles.displayL,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Barış Manço',
                    style: AppTextStyles.bodyL.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Aksiyon Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Kalp butonu – favori olunca MOR
                  GestureDetector(
                    onTap: () => setState(() => _isFavorite = !_isFavorite),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: _isFavorite ? const Color(0xFF7C4DFF).withValues(alpha: 0.12) : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? const Color(0xFF7C4DFF) : AppColors.textHint,
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.divider),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('✦', style: TextStyle(color: AppColors.primary)),
                        const SizedBox(width: 4),
                        Text('MUTLU', style: AppTextStyles.chip),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Sağdaki buton – play/stop toggle
                  GestureDetector(
                    onTap: () => setState(() => _isPlaying = !_isPlaying),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isPlaying ? Icons.stop_rounded : Icons.play_arrow_rounded,
                        color: AppColors.primary,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),

              // Kontroller
              TrackControlBar(
                currentPosition: Duration(seconds: _sliderValue.toInt()),
                totalDuration: const Duration(seconds: 210),
                isPlaying: _isPlaying,
                onPlayPause: () => setState(() => _isPlaying = !_isPlaying),
                onNext: () {},
                onPrevious: () {},
                onShuffle: () {},
                onRepeat: () {},
                onSeek: (val) => setState(() => _sliderValue = val),
              ),

              // Alt Kapsül
              GestureDetector(
                onTap: () => context.push('/next-musics'),
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.queue_music, color: AppColors.textPrimary),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sıradakiler', style: AppTextStyles.titleM),
                          Text('Sonraki: Gülpembe', style: AppTextStyles.label),
                        ],
                      ),
                      const Icon(Icons.keyboard_arrow_up, color: AppColors.textHint),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
