import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/music/bloc/music_bloc.dart';
import '../../../application/music/bloc/music_event.dart';
import '../../../application/music/bloc/music_state.dart';
import '../../../domain/mood/value_objects/mood_tag.dart';
import '../../../domain/music/entities/music_track.dart';
import '../../../injection.dart';
import '../../core/organisms/custom_bottom_nav_bar.dart';
import '../../core/state/player_state.dart';

/// Tarama sonrası mood → playlist öneri ekranı
class ScanResultPage extends StatelessWidget {
  final String detectedEmotion;

  const ScanResultPage({
    super.key,
    required this.detectedEmotion,
  });

  /// Detected emotion string'ini MoodTag'e çevirir (İngilizce + Türkçe)
  MoodTag _toMoodTag(String emotion) {
    switch (emotion.toLowerCase().trim()) {
      case 'happy':
      case 'mutlu':
      case 'enerjik':
      case 'heyecanlı':
      case 'özgüvenli':
      case 'coşkulu':
        return MoodTag.happy;
      case 'sad':
      case 'üzgün':
      case 'hüzünlü':
      case 'melankolik':
      case 'nostaljik':
        return MoodTag.sad;
      case 'angry':
      case 'kızgın':
      case 'sinirli':
        return MoodTag.angry;
      case 'fear':
      case 'korkmuş':
      case 'kaygılı':
      case 'yorgun':
      case 'uykulu':
        return MoodTag.fear;
      case 'surprise':
      case 'şaşkın':
      case 'aşık':
        return MoodTag.surprise;
      default:
        return MoodTag.neutral;
    }
  }

  String _moodEmoji(MoodTag tag) {
    switch (tag) {
      case MoodTag.happy:
        return '😊';
      case MoodTag.sad:
        return '😢';
      case MoodTag.angry:
        return '😡';
      case MoodTag.fear:
        return '😨';
      case MoodTag.surprise:
        return '😲';
      case MoodTag.neutral:
        return '😐';
    }
  }

  String _moodLabel(MoodTag tag) {
    switch (tag) {
      case MoodTag.happy:
        return 'Mutlu';
      case MoodTag.sad:
        return 'Üzgün';
      case MoodTag.angry:
        return 'Kızgın';
      case MoodTag.fear:
        return 'Korkmuş';
      case MoodTag.surprise:
        return 'Şaşkın';
      case MoodTag.neutral:
        return 'Nötr';
    }
  }

  // Türkçe duygu ve emojilerini tutan harita
  static const Map<String, String> _customEmojis = {
    'mutlu': '😊',
    'hüzünlü': '😢',
    'sinirli': '😠',
    'sakin': '🌙',
    'enerjik': '⚡',
    'yorgun': '😴',
    'aşık': '😍',
    'kaygılı': '😰',
    'heyecanlı': '🤩',
    'melankolik': '🍂',
    'özgüvenli': '😎',
    'coşkulu': '🎉',
    'odaklanmış': '🎯',
    'uykulu': '🥱',
    'rahat': '😌',
    'nostaljik': '📻',
  };

  String _getDisplayLabel(String rawEmotion, MoodTag tag) {
    final lower = rawEmotion.toLowerCase().trim();
    if (_customEmojis.containsKey(lower)) {
      // capitalize first letter
      return lower[0].toUpperCase() + lower.substring(1);
    }
    return _moodLabel(tag);
  }

  String _getDisplayEmoji(String rawEmotion, MoodTag tag) {
    final lower = rawEmotion.toLowerCase().trim();
    if (_customEmojis.containsKey(lower)) {
      return _customEmojis[lower]!;
    }
    return _moodEmoji(tag);
  }

  String _getMusicQueryEmotion(String rawEmotion) {
    final lower = rawEmotion.toLowerCase().trim();
    if (lower == 'üzgün' || lower == 'sad') return 'motive edici';
    if (lower == 'kızgın' || lower == 'angry' || lower == 'sinirli') return 'sakin';
    if (lower == 'korkmuş' || lower == 'fear' || lower == 'kaygılı') return 'sakin';
    return rawEmotion;
  }

  String _getMotivationalText(String rawEmotion) {
    final lower = rawEmotion.toLowerCase().trim();
    if (lower == 'üzgün' || lower == 'sad' || lower == 'hüzünlü') {
      return 'Bazen işler yolunda gitmeyebilir ama unutma, her karanlık gecenin bir sabahı vardır. Senin için seçtiğimiz motive edici müziklerle enerjini topla!';
    } else if (lower == 'kızgın' || lower == 'angry' || lower == 'sinirli') {
      return 'Derin bir nefes al ve biraz rahatla. Senin için seçtiğimiz sakin müziklerle öfkeni dindir.';
    } else if (lower == 'korkmuş' || lower == 'fear' || lower == 'kaygılı') {
      return 'Güvendesin. Korkuların geçici. Senin için seçtiğimiz sakinleştirici melodilerle huzur bul.';
    } else if (lower == 'mutlu' || lower == 'happy') {
      return 'Gülümsemek sana çok yakışıyor! Mutluluğunu bu enerjik müziklerle taçlandır.';
    } else if (lower == 'nötr' || lower == 'neutral') {
      return 'Durgun bir an yaşıyorsun. Biraz renk katmak istersen bu parçalar tam sana göre!';
    }
    return 'Bugün senin için özel olarak seçtiğimiz bu müziklerle anın tadını çıkar.';
  }

  @override
  Widget build(BuildContext context) {
    final moodTag = _toMoodTag(detectedEmotion);
    final musicQueryEmotion = _getMusicQueryEmotion(detectedEmotion);
    final motivationalText = _getMotivationalText(detectedEmotion);

    // Türkçe özel duygu adları veya override edilmiş müzik duyguları için moodName event'ini kullan
    final useMoodName = [
      'melankolik', 'nostaljik', 'enerjik', 'sakin', 'yorgun',
      'aşık', 'kaygılı', 'heyecanlı', 'özgüvenli', 'coşkulu',
      'odaklanmış', 'uykulu', 'rahat', 'hüzünlü', 'sinirli',
      'motive edici'
    ].contains(musicQueryEmotion.toLowerCase().trim());

    return BlocProvider(
      create: (_) => getIt<MusicBloc>()
        ..add(useMoodName
            ? MusicEvent.tracksRequestedByMoodName(musicQueryEmotion)
            : MusicEvent.tracksRequestedByMood(moodTag)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFEDF2F9), Color(0xFFDCE8F5), Color(0xFFCFDCEE)],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SafeArea(
                  bottom: false,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 50, 24, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top bar
                        Row(
                          children: [
                            _CircleBackButton(
                                onTap: () => context.go('/home')),
                            const SizedBox(width: 16),
                            const Text(
                              'MoodTune',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF1A2A3A),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Result center
                        Center(
                          child: Column(
                            children: [
                              const Text(
                                'Duygun Tarandı!',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF1A2A3A),
                                ),
                              ),
                              const SizedBox(height: 6),
                              const SizedBox(height: 14),
                              _MoodBadge(
                                label:
                                    '${_getDisplayEmoji(detectedEmotion, moodTag)} ${_getDisplayLabel(detectedEmotion, moodTag)}',
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.6),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  motivationalText,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF4A6A8A),
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),

                        // Playlist label
                        const Text(
                          'Sana Özel Müzikler',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF1A2A3A),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // BLoC ile müzik listesi
                        BlocBuilder<MusicBloc, MusicState>(
                          builder: (context, state) {
                            return state.when(
                              initial: () => const _MusicLoadingWidget(),
                              loading: () => const _MusicLoadingWidget(),
                              tracksLoaded: (tracks) {
                                if (tracks.isEmpty) {
                                  return const _MusicEmptyWidget();
                                }
                                return Column(
                                  children: tracks.map((track) {
                                    final trackIndex =
                                        tracks.indexOf(track);
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 12),
                                      child: _MusicTrackCard(
                                        title: track.title,
                                        channelName: track.channelName,
                                        thumbnailUrl: track.thumbnailUrl,
                                        durationMs: track.durationMs,
                                        onTap: () {
                                          PlayerState.playTrack(
                                            track,
                                            tracks,
                                            trackIndex,
                                          );
                                        },
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                              recentlyPlayedLoaded: (_) =>
                                  const _MusicEmptyWidget(),
                              playlistLoaded: (_) =>
                                  const _MusicEmptyWidget(),
                              searchResultsLoaded: (_) =>
                                  const _MusicEmptyWidget(),
                              failure: (f) => _MusicErrorWidget(
                                onRetry: () => context
                                    .read<MusicBloc>()
                                    .add(useMoodName
                                        ? MusicEvent.tracksRequestedByMoodName(
                                            detectedEmotion)
                                        : MusicEvent.tracksRequestedByMood(
                                            moodTag)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Loading ──────────────────────────────────────────────────────────────────

class _MusicLoadingWidget extends StatelessWidget {
  const _MusicLoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF7C4DFF)),
        ),
        const SizedBox(height: 12),
        const Text(
          'YouTube\'dan müzikler yükleniyor...',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8AAAC8),
          ),
        ),
      ],
    );
  }
}

// ── Empty ─────────────────────────────────────────────────────────────────────

class _MusicEmptyWidget extends StatelessWidget {
  const _MusicEmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Şarkı bulunamadı 🎵',
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF8AAAC8),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ── Error ─────────────────────────────────────────────────────────────────────

class _MusicErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const _MusicErrorWidget({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Müzikler yüklenemedi 😕',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A2A3A),
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: onRetry,
          child: const Text(
            'Tekrar Dene',
            style: TextStyle(color: Color(0xFF7C4DFF)),
          ),
        ),
      ],
    );
  }
}

// ── Track Card ────────────────────────────────────────────────────────────────

class _MusicTrackCard extends StatelessWidget {
  final String title;
  final String channelName;
  final String thumbnailUrl;
  final int? durationMs;
  final VoidCallback onTap;

  const _MusicTrackCard({
    required this.title,
    required this.channelName,
    required this.thumbnailUrl,
    required this.durationMs,
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
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.75),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                thumbnailUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, _) => Container(
                  width: 60,
                  height: 60,
                  color: const Color(0xFF7C4DFF).withValues(alpha: 0.1),
                  child: const Icon(Icons.music_note,
                      color: Color(0xFF7C4DFF)),
                ),
              ),
            ),
            const SizedBox(width: 14),
            // Bilgiler
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
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
                    channelName,
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
            // Süre + Play
            Column(
              children: [
                Text(
                  _formatDuration(durationMs),
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF8AAAC8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFA78BFA), Color(0xFF7C6ADC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.play_arrow,
                        color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Shared Widgets ────────────────────────────────────────────────────────────

class _MoodBadge extends StatelessWidget {
  final String label;
  const _MoodBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
          color: Color(0xFF1A2A3A),
        ),
      ),
    );
  }
}

class _CircleBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const _CircleBackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.65),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Text('←',
              style: TextStyle(fontSize: 20, color: Color(0xFF1A2A3A))),
        ),
      ),
    );
  }
}
