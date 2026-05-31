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
import '../../../domain/music/repositories/i_music_repository.dart';
import '../../../injection.dart';
import '../../core/state/player_state.dart';
import '../../../domain/music/entities/youtube_search_result.dart';

class NewPlaylistPage extends StatefulWidget {
  final Map<String, dynamic>? existingPlaylist;

  const NewPlaylistPage({super.key, this.existingPlaylist});

  @override
  State<NewPlaylistPage> createState() => _NewPlaylistPageState();
}

class _NewPlaylistPageState extends State<NewPlaylistPage> {
  String _selectedMood = 'Enerjik';
  File? _coverImage;
  bool _isPicking = false;
  final _searchController = TextEditingController();
  bool _showSearch = false;
  bool _isSearching = false;
  final List<Map<String, String>> _songs = [];
  List<YouTubeSearchResult> _searchResults = [];

  final List<Map<String, String>> _moods = [
    {'text': 'Sakin', 'emoji': '🌙'},
    {'text': 'Enerjik', 'emoji': '⚡'},
    {'text': 'Odaklanmış', 'emoji': '🎯'},
    {'text': 'Mutlu', 'emoji': '😊'},
  ];

  TextEditingController _nameController = TextEditingController();
  String? _existingPlaylistId;

  @override
  void initState() {
    super.initState();
    if (widget.existingPlaylist != null) {
      final pl = widget.existingPlaylist!;
      _existingPlaylistId = pl['id'];
      _nameController.text = pl['title'] ?? '';
      final emoji = pl['emoji'] ?? '⚡';
      try {
        final moodEntry = _moods.firstWhere((m) => m['emoji'] == emoji);
        _selectedMood = moodEntry['text']!;
      } catch (_) {
        _selectedMood = _moods[1]['text']!;
      }
      
      final savedSongs = pl['songs'] as List<dynamic>? ?? [];
      for (var s in savedSongs) {
        if (s is Map) {
          _songs.add({
            'title': s['title']?.toString() ?? '',
            'artist': s['artist']?.toString() ?? '',
            'youtubeVideoId': s['youtubeVideoId']?.toString() ?? '',
            'thumbnailUrl': s['thumbnailUrl']?.toString() ?? '',
          });
        }
      }

      final coverPath = pl['thumbnailUrl'] as String?;
      if (coverPath != null && coverPath.isNotEmpty) {
        _coverImage = File(coverPath);
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _nameController.dispose();
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

  Future<void> _performSearch(String query) async {
    if (query.trim().isEmpty) {
      setState(() {
        _searchResults = [];
        _isSearching = false;
      });
      return;
    }

    setState(() => _isSearching = true);
    final repo = getIt<IMusicRepository>();
    final result = await repo.searchYouTube(query);
    
    if (mounted) {
      setState(() {
        _isSearching = false;
        result.fold(
          (l) => _searchResults = [],
          (r) => _searchResults = r,
        );
      });
    }
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
        title: Text(widget.existingPlaylist != null ? 'Listeyi Düzenle' : 'Yeni Playlist', style: AppTextStyles.titleL),
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

            AppTextField(hintText: 'Oynatma Listesi Adı', controller: _nameController),
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
                  onSubmitted: (val) => _performSearch(val),
                  onChanged: (val) {
                    if (val.isEmpty) {
                      setState(() {
                        _searchResults = [];
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Şarkı veya sanatçı ara (Enter\'a bas)...',
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
                child: _isSearching 
                    ? const Center(child: CircularProgressIndicator())
                    : ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: _searchResults.map((song) {
                    final songTitle = song.title;
                    final songArtist = song.channelName;
                    final alreadyAdded = _songs.any((s) => s['title'] == songTitle);
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: song.thumbnailUrl.isNotEmpty 
                            ? Image.network(song.thumbnailUrl, width: 36, height: 36, fit: BoxFit.cover)
                            : Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(alpha: 0.1),
                                ),
                                child: const Icon(Icons.music_note,
                                    color: AppColors.primary, size: 18),
                              ),
                      ),
                      title: Text(songTitle,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                      subtitle: Text(songArtist,
                          style: const TextStyle(fontSize: 12, color: AppColors.textHint), maxLines: 1, overflow: TextOverflow.ellipsis),
                      trailing: alreadyAdded
                          ? const Icon(Icons.check, color: Colors.green, size: 20)
                          : const Icon(Icons.add_circle_outline,
                              color: AppColors.primary, size: 24),
                      onTap: alreadyAdded ? null : () => _addSong({
                        'title': songTitle,
                        'artist': songArtist,
                        'youtubeVideoId': song.videoId,
                        'thumbnailUrl': song.thumbnailUrl,
                      }),
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
              text: widget.existingPlaylist != null ? 'Kaydet' : 'Oluştur',
              onPressed: () {
                final playlistName = _nameController.text.trim().isNotEmpty ? _nameController.text.trim() : 'Yeni Liste';
                final newPlaylist = {
                  'id': _existingPlaylistId ?? DateTime.now().millisecondsSinceEpoch.toString(),
                  'title': playlistName,
                  'emoji': _moods.firstWhere((m) => m['text'] == _selectedMood)['emoji'],
                  'songCount': _songs.length,
                  'thumbnailUrl': _coverImage?.path ?? '',
                  'songs': _songs.map((s) => {
                    'title': s['title'],
                    'artist': s['artist'],
                    'youtubeVideoId': s['youtubeVideoId'] ?? '',
                    'thumbnailUrl': s['thumbnailUrl'] ?? '',
                  }).toList(),
                };
                final repo = getIt<IMusicRepository>();
                repo.addMyPlaylist(newPlaylist);
                Navigator.of(context).pop();
              },
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
