import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/music/entities/music_track.dart';
import '../../../domain/music/value_objects/track_source.dart';
import '../../../domain/mood/value_objects/mood_tag.dart';
import '../../core/state/player_state.dart';

class LocalPlaylistPage extends StatelessWidget {
  final String title;
  final String mood;
  final List<dynamic> songs; // List of Map

  const LocalPlaylistPage({
    super.key,
    required this.title,
    required this.mood,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    // Convert maps to MusicTrack objects
    final List<MusicTrack> tracks = songs.map((s) {
      return MusicTrack(
        id: s['youtubeVideoId'] as String? ?? '',
        title: s['title'] as String? ?? 'Bilinmeyen Şarkı',
        artist: s['artist'] as String? ?? 'Bilinmeyen Sanatçı',
        youtubeVideoId: s['youtubeVideoId'] as String? ?? '',
        youtubeUrl: 'https://www.youtube.com/watch?v=${s['youtubeVideoId']}',
        thumbnailUrl: s['thumbnailUrl'] as String? ?? '',
        channelName: s['artist'] as String? ?? '',
        moodTag: MoodTag.neutral, // Local tracks don't strictly need a mapped mood
        source: TrackSource.youtubeApi,
        durationMs: 0,
      );
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFEDF2F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF1A2A3A)),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF1A2A3A),
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
      body: tracks.isEmpty
          ? const Center(
              child: Text(
                'Bu çalma listesi boş.',
                style: TextStyle(color: Color(0xFF8AAAC8)),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                final track = tracks[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _LocalTrackCard(
                    track: track,
                    onTap: () {
                      PlayerState.playTrack(track, tracks, index);
                    },
                  ),
                );
              },
            ),
    );
  }
}

class _LocalTrackCard extends StatelessWidget {
  final MusicTrack track;
  final VoidCallback onTap;

  const _LocalTrackCard({
    required this.track,
    required this.onTap,
  });

  String _formatDuration(int? ms) {
    if (ms == null || ms == 0) return '--:--';
    final total = ms ~/ 1000;
    final m = total ~/ 60;
    final s = total % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: track.thumbnailUrl.isNotEmpty
                  ? Image.network(
                      track.thumbnailUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, _) => _fallbackIcon(),
                    )
                  : _fallbackIcon(),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    track.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A2A3A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    track.channelName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF8AAAC8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              _formatDuration(track.durationMs ?? 0),
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF8AAAC8),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.play_circle_fill, color: Color(0xFF7C4DFF), size: 28),
          ],
        ),
      ),
    );
  }

  Widget _fallbackIcon() {
    return Container(
      width: 60,
      height: 60,
      color: const Color(0xFF7C4DFF).withValues(alpha: 0.1),
      child: const Icon(Icons.music_note, color: Color(0xFF7C4DFF)),
    );
  }
}
