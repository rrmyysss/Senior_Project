import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' hide PlayerState;

import '../../../application/music/bloc/music_bloc.dart';
import '../../../application/music/bloc/music_event.dart';
import '../../../domain/music/entities/music_track.dart';
import '../../../domain/music/repositories/i_music_repository.dart';
import '../../../injection.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/molecules/track_control_bar.dart';
import '../../core/state/player_state.dart';

class FullPlayerOverlay extends StatefulWidget {
  final YoutubePlayerController? ytController;

  const FullPlayerOverlay({
    super.key,
    required this.ytController,
  });

  @override
  State<FullPlayerOverlay> createState() => _FullPlayerOverlayState();
}

class _FullPlayerOverlayState extends State<FullPlayerOverlay> {
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  bool _isFavoriteFor(MusicTrack track) {
    return PlayerState.favoriteSongs.value.any((s) => s['title'] == track.title);
  }

  Future<void> _toggleFavorite(MusicTrack track) async {
    final repo = getIt<IMusicRepository>();
    if (_isFavoriteFor(track)) {
      await repo.removeFavoriteSong(track.title);
    } else {
      await repo.addFavoriteSong({
        'title': track.title,
        'artist': track.channelName,
        'image': track.thumbnailUrl,
      });
    }
    // ValueNotifier değiştiğinde build() yeniden tetiklenir
  }

  @override
  void initState() {
    super.initState();
    widget.ytController?.addListener(_ytListener);
  }

  @override
  void didUpdateWidget(covariant FullPlayerOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.ytController != widget.ytController) {
      oldWidget.ytController?.removeListener(_ytListener);
      widget.ytController?.addListener(_ytListener);
    }
  }

  @override
  void dispose() {
    widget.ytController?.removeListener(_ytListener);
    super.dispose();
  }

  void _ytListener() {
    if (widget.ytController == null) return;
    final val = widget.ytController!.value;
    if (val.position != _currentPosition || val.metaData.duration != _totalDuration) {
      setState(() {
        _currentPosition = val.position;
        _totalDuration = val.metaData.duration;
      });
    }
  }

  void _playNext() {
    final playlist = PlayerState.currentPlaylist.value;
    final currentIndex = PlayerState.currentIndex.value;
    if (currentIndex < playlist.length - 1) {
      final nextTrack = playlist[currentIndex + 1];
      PlayerState.playTrack(nextTrack, playlist, currentIndex + 1);
    }
  }

  void _playPrevious() {
    final playlist = PlayerState.currentPlaylist.value;
    final currentIndex = PlayerState.currentIndex.value;
    if (currentIndex > 0) {
      final prevTrack = playlist[currentIndex - 1];
      PlayerState.playTrack(prevTrack, playlist, currentIndex - 1);
    }
  }

  String _getMoodLabel(MusicTrack track) {
    final name = track.moodTag.name;
    switch (name) {
      case 'happy':
        return 'MUTLU';
      case 'sad':
        return 'ÜZGÜN';
      case 'angry':
        return 'KIZGIN';
      case 'fear':
        return 'KORKMUŞ';
      case 'surprise':
        return 'ŞAŞKIN';
      case 'neutral':
        return 'NÖTR';
      default:
        return name.toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: PlayerState.isFullPlayerVisible,
      builder: (context, isVisible, child) {
        final screenHeight = MediaQuery.of(context).size.height;
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          top: isVisible ? 0 : screenHeight,
          left: 0,
          right: 0,
          bottom: isVisible ? 0 : -screenHeight,
          child: Material(
            color: Colors.white,
            child: ValueListenableBuilder<MusicTrack?>(
              valueListenable: PlayerState.currentTrack,
              builder: (context, currentTrack, child) {
                if (currentTrack == null || widget.ytController == null) {
                  return const SizedBox.shrink();
                }

                return _buildContent(context, currentTrack);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, MusicTrack track) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: widget.ytController!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.primary,
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.textHint,
                size: 32,
              ),
              onPressed: () {
                PlayerState.isFullPlayerVisible.value = false;
              },
            ),
            title: Column(
              children: [
                Text(
                  'ŞU AN ÇALIYOR',
                  style: AppTextStyles.label.copyWith(fontSize: 10, letterSpacing: 1.2),
                ),
                Text('MoodTune Tavsiyesi', style: AppTextStyles.label),
              ],
            ),
            centerTitle: true,
            actions: [
              ValueListenableBuilder<List<Map<String, String>>>(
                valueListenable: PlayerState.favoriteSongs,
                builder: (context, favs, _) {
                  final isFav = favs.any((s) => s['title'] == track.title);
                  return IconButton(
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? const Color(0xFF7C4DFF) : AppColors.textPrimary,
                    ),
                    onPressed: () => _toggleFavorite(track),
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: player,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        track.title,
                        style: AppTextStyles.displayL,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        track.channelName,
                        style: AppTextStyles.bodyL.copyWith(color: AppColors.textSecondary),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  ValueListenableBuilder<bool>(
                    valueListenable: PlayerState.isPlaying,
                    builder: (context, isPlaying, child) {
                      return TrackControlBar(
                        currentPosition: _currentPosition,
                        totalDuration: _totalDuration.inSeconds > 0 ? _totalDuration : Duration(milliseconds: track.durationMs ?? 0),
                        isPlaying: isPlaying,
                        onPlayPause: () {
                          if (isPlaying) {
                            widget.ytController!.pause();
                          } else {
                            widget.ytController!.play();
                          }
                          PlayerState.togglePlay();
                        },
                        onNext: _playNext,
                        onPrevious: _playPrevious,
                        onShuffle: () {},
                        onRepeat: () {},
                        onSeek: (value) {
                          widget.ytController?.seekTo(Duration(seconds: value.toInt()));
                        },
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      PlayerState.isFullPlayerVisible.value = false;
                      context.push(
                        '/next-musics',
                        extra: {
                          'tracks': PlayerState.currentPlaylist.value,
                          'currentIndex': PlayerState.currentIndex.value,
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.queue_music, color: AppColors.textPrimary),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sıradakiler', style: AppTextStyles.titleM),
                                Text(
                                  PlayerState.currentPlaylist.value.length > PlayerState.currentIndex.value + 1
                                      ? 'Sonraki: ${PlayerState.currentPlaylist.value[PlayerState.currentIndex.value + 1].title}'
                                      : 'Playlist sonu',
                                  style: AppTextStyles.label,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Icon(Icons.keyboard_arrow_up, color: AppColors.textHint),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
