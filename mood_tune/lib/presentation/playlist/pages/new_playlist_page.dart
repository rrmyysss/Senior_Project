import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/atoms/app_text_field.dart';
import '../../core/atoms/primary_button.dart';
import '../../core/atoms/mood_chip.dart';
import '../../core/atoms/gradient_scaffold.dart';

class NewPlaylistPage extends StatefulWidget {
  const NewPlaylistPage({super.key});

  @override
  State<NewPlaylistPage> createState() => _NewPlaylistPageState();
}

class _NewPlaylistPageState extends State<NewPlaylistPage> {
  String _selectedMood = 'Enerjik';
  File? _coverImage;
  bool _isPicking = false;
  final _searchController = TextEditingController();
  bool _showSearch = false;
  final List<Map<String, String>> _songs = [
    {'title': 'Blinding Lights', 'artist': 'The Weeknd'},
    {'title': 'Save Your Tears', 'artist': 'The Weeknd'},
  ];

  final List<Map<String, String>> _searchResults = [
    {'title': 'Midnight City', 'artist': 'M83'},
    {'title': 'Levitating', 'artist': 'Dua Lipa'},
    {'title': 'As It Was', 'artist': 'Harry Styles'},
    {'title': 'Watermelon Sugar', 'artist': 'Harry Styles'},
    {'title': 'Bohemian Rhapsody', 'artist': 'Queen'},
    {'title': 'Stairway to Heaven', 'artist': 'Led Zeppelin'},
    {'title': 'Hotel California', 'artist': 'Eagles'},
    {'title': 'Smells Like Teen Spirit', 'artist': 'Nirvana'},
  ];

  final List<Map<String, String>> _moods = [
    {'text': 'Sakin', 'emoji': '🌙'},
    {'text': 'Enerjik', 'emoji': '⚡'},
    {'text': 'Odaklanmış', 'emoji': '🎯'},
    {'text': 'Mutlu', 'emoji': '😊'},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    if (_isPicking) return;
    setState(() => _isPicking = true);
    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        setState(() => _coverImage = File(picked.path));
      }
    } finally {
      setState(() => _isPicking = false);
    }
  }

  List<Map<String, String>> get _filteredResults {
    final q = _searchController.text.toLowerCase();
    if (q.isEmpty) return _searchResults;
    return _searchResults
        .where((s) => s['title']!.toLowerCase().contains(q) || s['artist']!.toLowerCase().contains(q))
        .toList();
  }

  void _addSong(Map<String, String> song) {
    if (!_songs.any((s) => s['title'] == song['title'])) {
      setState(() => _songs.add(song));
    }
    setState(() {
      _showSearch = false;
      _searchController.clear();
    });
  }

  void _removeSong(int index) {
    setState(() => _songs.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: Text('Yeni Playlist', style: AppTextStyles.titleL),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textPrimary, size: 20),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kapak fotoğrafı
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: _coverImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          _coverImage!,
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      )
                    : CustomPaint(
                        painter: _DottedRectPainter(
                            color: AppColors.primary,
                            strokeWidth: 2,
                            dashWidth: 6,
                            dashSpace: 6,
                            radius: 20),
                        child: Container(
                          width: 140,
                          height: 140,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add_photo_alternate_rounded,
                                  size: 40, color: AppColors.primary),
                              const SizedBox(height: 8),
                              Text('Fotoğraf Ekle',
                                  style: AppTextStyles.label
                                      .copyWith(color: AppColors.primary)),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 32),

            const AppTextField(hintText: 'Oynatma Listesi Adı'),
            const SizedBox(height: 16),
            const AppTextField(hintText: 'Açıklama (İsteğe bağlı)'),
            const SizedBox(height: 24),

            // Mood Tags
            Text('Bu playlistin hissi:', style: AppTextStyles.titleM),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: _moods.map((mood) {
                return MoodChip(
                  text: mood['text']!,
                  emoji: mood['emoji']!,
                  isSelected: _selectedMood == mood['text'],
                  onTap: () => setState(() => _selectedMood = mood['text']!),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),

            // Şarkılar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Şarkılar (${_songs.length})', style: AppTextStyles.titleM),
                GestureDetector(
                  onTap: () => setState(() {
                    _showSearch = !_showSearch;
                    if (!_showSearch) _searchController.clear();
                  }),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add, color: Colors.white, size: 18),
                        const SizedBox(width: 4),
                        Text('Şarkı Ekle',
                            style: AppTextStyles.label.copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Arama Çubuğu
            if (_showSearch) ...[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  autofocus: true,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: 'Şarkı veya sanatçı ara...',
                    hintStyle: TextStyle(color: AppColors.textHint, fontSize: 14),
                    prefixIcon: const Icon(Icons.search, color: AppColors.textHint),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.close, color: AppColors.textHint),
                            onPressed: () => setState(() => _searchController.clear()),
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                constraints: const BoxConstraints(maxHeight: 240),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: _filteredResults.map((song) {
                    final alreadyAdded = _songs.any((s) => s['title'] == song['title']);
                    return ListTile(
                      leading: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.music_note,
                            color: AppColors.primary, size: 18),
                      ),
                      title: Text(song['title']!,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                      subtitle: Text(song['artist']!,
                          style: const TextStyle(fontSize: 12, color: AppColors.textHint)),
                      trailing: alreadyAdded
                          ? const Icon(Icons.check, color: Colors.green, size: 20)
                          : const Icon(Icons.add_circle_outline,
                              color: AppColors.primary, size: 24),
                      onTap: alreadyAdded ? null : () => _addSong(song),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 12),
            ],

            // Şarkı Listesi
            ..._songs.asMap().entries.map((entry) {
              final i = entry.key;
              final song = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildSongItem(song['title']!, song['artist']!, () => _removeSong(i)),
              );
            }),

            const SizedBox(height: 32),

            PrimaryButton(
              text: 'Oluştur',
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSongItem(String title, String artist, VoidCallback onRemove) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.music_note, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyles.bodyM
                        .copyWith(fontWeight: FontWeight.bold)),
                Text(artist,
                    style: AppTextStyles.label
                        .copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent),
            onPressed: onRemove,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

class _DottedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double radius;

  _DottedRectPainter({
    required this.color,
    this.strokeWidth = 2,
    this.dashWidth = 6,
    this.dashSpace = 6,
    this.radius = 20,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    Path path = Path()..addRRect(rrect);

    Path dashPath = Path();
    double distance = 0.0;
    for (ui.PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
      distance = 0.0;
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
