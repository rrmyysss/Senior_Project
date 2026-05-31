import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../application/music/bloc/music_bloc.dart';
import '../../../application/music/bloc/music_event.dart';
import '../../../application/music/bloc/music_state.dart';
import '../../../domain/music/entities/music_track.dart';
import '../../core/state/player_state.dart';

class RecentlyPlayedPage extends StatefulWidget {
  const RecentlyPlayedPage({super.key});

  @override
  State<RecentlyPlayedPage> createState() => _RecentlyPlayedPageState();
}

class _RecentlyPlayedPageState extends State<RecentlyPlayedPage> {
  @override
  void initState() {
    super.initState();
    // Dispatch event to make sure we have the latest recently played tracks
    context.read<MusicBloc>().add(const MusicEvent.recentlyPlayedRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF2F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF1A2A3A)),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Son Çalınanlar',
          style: TextStyle(
            color: Color(0xFF1A2A3A),
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Color(0xFF1A2A3A)),
            onPressed: () {
              context.read<MusicBloc>().add(const MusicEvent.recentlyPlayedCleared());
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<MusicTrack>>(
        valueListenable: PlayerState.recentTracks,
        builder: (context, tracks, child) {
          if (tracks.isEmpty) {
            return const Center(
              child: Text(
                'Henüz şarkı dinlemedin.',
                style: TextStyle(color: Color(0xFF8AAAC8)),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            itemCount: tracks.length,
            itemBuilder: (context, index) {
              final track = tracks[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _TrackCard(
                  track: track,
                  onTap: () {
                    PlayerState.playTrack(track, [track], 0);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _TrackCard extends StatelessWidget {
  final MusicTrack track;
  final VoidCallback onTap;

  const _TrackCard({
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
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: track.thumbnailUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.music_note, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    track.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A2A3A),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    track.channelName,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8AAAC8),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              _formatDuration(track.durationMs),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF8AAAC8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
