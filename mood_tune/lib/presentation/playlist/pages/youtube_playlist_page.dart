import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/music/bloc/music_bloc.dart';
import '../../../application/music/bloc/music_event.dart';
import '../../../application/music/bloc/music_state.dart';
import '../../../domain/music/entities/music_track.dart';
import '../../../domain/music/repositories/i_music_repository.dart';
import '../../../injection.dart';
import '../../core/state/player_state.dart';

class YouTubePlaylistPage extends StatefulWidget {
  final String playlistId;
  final String title;
  final String mood;
  final String? thumbnailUrl;

  const YouTubePlaylistPage({
    super.key,
    required this.playlistId,
    required this.title,
    required this.mood,
    this.thumbnailUrl,
  });

  @override
  State<YouTubePlaylistPage> createState() => _YouTubePlaylistPageState();
}

class _YouTubePlaylistPageState extends State<YouTubePlaylistPage> {
  late final MusicBloc _bloc;
  List<MusicTrack> _tracks = [];

  bool get _isFavorite {
    return PlayerState.favoritePlaylists.value
        .any((p) => p['playlistId'] == widget.playlistId);
  }

  Future<void> _toggleFavorite() async {
    final repo = getIt<IMusicRepository>();
    if (_isFavorite) {
      await repo.removeFavoritePlaylist(widget.playlistId);
    } else {
      await repo.addFavoritePlaylist({
        'playlistId': widget.playlistId,
        'title': widget.title,
        'mood': widget.mood,
        'thumbnailUrl': widget.thumbnailUrl ?? (_tracks.isNotEmpty ? _tracks.first.thumbnailUrl : ''),
        'songCount': _tracks.length,
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _bloc = getIt<MusicBloc>();
    if (widget.playlistId.startsWith('search_')) {
      final query = widget.playlistId.substring(7);
      _bloc.add(MusicEvent.tracksRequestedByMoodName(query));
    } else {
      _bloc.add(MusicEvent.playlistRequested(widget.playlistId));
    }
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
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
                widget.title,
                style: const TextStyle(
                  color: Color(0xFF1A2A3A),
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                widget.mood,
                style: const TextStyle(
                  color: Color(0xFF8AAAC8),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          actions: [
            ValueListenableBuilder<List<Map<String, dynamic>>>(
              valueListenable: PlayerState.favoritePlaylists,
              builder: (context, favs, _) {
                final isFav = favs.any((p) => p['playlistId'] == widget.playlistId);
                return IconButton(
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? const Color(0xFF7C4DFF) : const Color(0xFF8AAAC8),
                    size: 28,
                  ),
                  onPressed: _toggleFavorite,
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<MusicBloc, MusicState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF7C4DFF)),
                ),
              ),
              playlistLoaded: (tracks) {
                _tracks = tracks;
                return _buildTrackList(tracks);
              },
              tracksLoaded: (tracks) {
                _tracks = tracks;
                return _buildTrackList(tracks);
              },
              failure: (f) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Yüklenirken hata oluştu 😕'),
                    TextButton(
                      onPressed: () => _bloc.add(
                        widget.playlistId.startsWith('search_')
                            ? MusicEvent.tracksRequestedByMoodName(widget.playlistId.substring(7))
                            : MusicEvent.playlistRequested(widget.playlistId),
                      ),
                      child: const Text('Tekrar Dene'),
                    ),
                  ],
                ),
              ),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTrackList(List<MusicTrack> tracks) {
    if (tracks.isEmpty) {
      return const Center(
        child: Text(
          'Bu çalma listesi boş.',
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
          child: _PlaylistTrackCard(
            track: track,
            onTap: () {
              PlayerState.playTrack(track, tracks, index);
            },
          ),
        );
      },
    );
  }
}


class _PlaylistTrackCard extends StatelessWidget {
  final MusicTrack track;
  final VoidCallback onTap;

  const _PlaylistTrackCard({
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
              child: Image.network(
                track.thumbnailUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, _) => Container(
                  width: 60,
                  height: 60,
                  color: const Color(0xFF7C4DFF).withValues(alpha: 0.1),
                  child: const Icon(Icons.music_note, color: Color(0xFF7C4DFF)),
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
}
