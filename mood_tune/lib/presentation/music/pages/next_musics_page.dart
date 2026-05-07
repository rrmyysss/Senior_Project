import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/molecules/song_list_item.dart';

class NextMusicsPage extends StatelessWidget {
  const NextMusicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      appBar: AppBar(
        title: Column(
          children: [
            Text('Şu Anki Playlist', style: AppTextStyles.titleL),
            Text('18 parça', style: AppTextStyles.label.copyWith(color: AppColors.primary)),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.textPrimary, size: 32),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        itemCount: 15,
        itemBuilder: (context, index) {
          final isPlaying = index == 2; // Örnek olarak 3. şarkı çalıyor
          return SongListItem(
            title: isPlaying ? 'Sabah Işığı' : 'Şarkı $index',
            artist: isPlaying ? 'Barış Manço' : 'Sanatçı $index',
            imageUrl: 'https://picsum.photos/seed/song$index/100',
            isPlaying: isPlaying,
            isFavorite: index % 3 == 0,
            onTap: () {},
            onTrailingTap: () {},
          );
        },
      ),
    );
  }
}
