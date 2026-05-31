import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/state/player_state.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/atoms/gradient_scaffold.dart';
import '../../core/organisms/scan_card.dart';
import '../../../application/music/bloc/music_bloc.dart';
import '../../../application/music/bloc/music_event.dart';
import '../../../application/music/bloc/music_state.dart';
import '../../../domain/mood/value_objects/mood_tag.dart';
import '../../../domain/music/entities/music_track.dart';
import '../../../injection.dart';

/// Keşfet kartları — her biri bir mood temasını temsil eder
const _kMoodCards = [
  {
    'name': 'Doğa Sesleri',
    'mood': 'Rahatlama',
    'playlistId': 'search_doğa sesleri kısa',
    'imageUrl': 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?q=80&w=600&auto=format&fit=crop',
    'g1': 0xFF4A7C59,
    'g2': 0xFF31523A,
  },
  {
    'name': 'Gece Sürüşü',
    'mood': 'Melankolik',
    'playlistId': 'search_gece sürüşü kısa şarkılar',
    'imageUrl': 'https://images.unsplash.com/photo-1493246507139-91e8fad9978e?q=80&w=600&auto=format&fit=crop',
    'g1': 0xFF1E2D4E,
    'g2': 0xFF131D33,
  },
  {
    'name': 'Haftasonu',
    'mood': 'Parti',
    'playlistId': 'search_haftasonu enerjik şarkılar',
    'imageUrl': 'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?q=80&w=600&auto=format&fit=crop',
    'g1': 0xFFC4956A,
    'g2': 0xFF8A6440,
  },
  {
    'name': 'Yoga Akışı',
    'mood': 'Wellness',
    'playlistId': 'search_yoga meditasyon dinlendirici müzik',
    'imageUrl': 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?q=80&w=600&auto=format&fit=crop',
    'g1': 0xFF90BC88,
    'g2': 0xFF5D8556,
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MusicBloc>()
        ..add(const MusicEvent.recentlyPlayedRequested()),
      child: GradientScaffold(
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Header ───────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 52, 22, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseAuth.instance.currentUser != null
                            ? FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .snapshots()
                            : const Stream.empty(),
                        builder: (context, snapshot) {
                          final data =
                              snapshot.data?.data() as Map<String, dynamic>?;
                          String name = data?['displayName']?.toString() ??
                              FirebaseAuth.instance.currentUser?.displayName ??
                              '';
                          if (name.trim().isEmpty || name.contains('@')) {
                            name = 'Kullanıcı';
                          } else {
                            name = name.split(' ').first;
                          }
                          return Text(
                            'Merhaba, $name 👋',
                            style:
                                AppTextStyles.displayM.copyWith(fontSize: 24),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // ── Scan Card ────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: ScanCard(
                    onScanTap: () => context.push('/mood-detection'),
                  ),
                ),
                const SizedBox(height: 28),

                // ── Son Çalınanlar (YouTube'dan) ──────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Son Çalınanlar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF1A2A3A),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.push('/recently-played'),
                        child: const Text(
                          'Tümü',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF7C4DFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // YouTube'dan gelen şarkılar (yatay liste)
                ValueListenableBuilder<List<MusicTrack>>(
                  valueListenable: PlayerState.recentTracks,
                  builder: (context, tracks, child) {
                    if (tracks.isEmpty) {
                      return _buildRecentFallback(context);
                    }
                    return SizedBox(
                      height: 176,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        itemCount: tracks.length,
                        itemBuilder: (context, i) {
                          final track = tracks[i];
                          return _RecentTrackCard(
                            title: track.title,
                            channelName: track.channelName,
                            thumbnailUrl: track.thumbnailUrl,
                            onTap: () {
                              PlayerState.playTrack(
                                track,
                                [track], // Sadece şarkıyı ekle, tüm listeyi değil!
                                0,
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 28),

                // ── Sana Özel (Mood Kartları) ─────────────────────
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Text(
                    'Sana Özel',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1A2A3A),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: _kMoodCards.length,
                    itemBuilder: (context, i) {
                      final item = _kMoodCards[i];
                      return _MoodCard(
                        name: item['name'] as String,
                        mood: item['mood'] as String,
                        playlistId: item['playlistId'] as String,
                        imageUrl: item['imageUrl'] as String,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentLoading() {
    return SizedBox(
      height: 176,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        itemCount: 5,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF7C4DFF)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 12,
                    width: 90,
                    color: Colors.grey[200],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecentFallback(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.music_note, size: 40, color: Color(0xFF8AAAC8)),
            const SizedBox(height: 8),
            const Text(
              'Henüz hiçbir şarkı dinlemedin.',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A2A3A),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Aşağıdan bir mod seç ve keşfetmeye başla!',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8AAAC8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── YouTube'dan Gelen Şarkı Kartı ─────────────────────────────────────────────

class _RecentTrackCard extends StatelessWidget {
  final String title;
  final String channelName;
  final String thumbnailUrl;
  final VoidCallback onTap;

  const _RecentTrackCard({
    required this.title,
    required this.channelName,
    required this.thumbnailUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                  imageUrl: thumbnailUrl,
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 130,
                    height: 130,
                    color: const Color(0xFF7C4DFF).withValues(alpha: 0.08),
                    child: const Icon(Icons.music_note,
                        color: Color(0xFF7C4DFF), size: 36),
                  ),
                  errorWidget: (context, url, _) => Container(
                    width: 130,
                    height: 130,
                    color: const Color(0xFF7C4DFF).withValues(alpha: 0.08),
                    child: const Icon(Icons.music_note,
                        color: Color(0xFF7C4DFF), size: 36),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A2A3A),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                channelName,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8AAAC8),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Statik Fallback Kart ───────────────────────────────────────────────────────

class _RecentStaticCard extends StatelessWidget {
  final String name;
  final Color bg;
  final String em;

  const _RecentStaticCard({
    required this.name,
    required this.bg,
    required this.em,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Text(em, style: const TextStyle(fontSize: 40)),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              name,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A2A3A),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Mood Kartı (Sana Özel) — YouTube'a bağlı ─────────────────────────────────

class _MoodCard extends StatelessWidget {
  final String name;
  final String mood;
  final String playlistId;
  final String imageUrl;

  const _MoodCard({
    required this.name,
    required this.mood,
    required this.playlistId,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/youtube-playlist', extra: {
        'playlistId': playlistId,
        'title': name,
        'mood': mood,
      }),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1A2A3A),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.image_not_supported, color: Colors.white54),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.8),
                      Colors.black.withValues(alpha: 0.0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
              Positioned(
                bottom: 14,
                left: 14,
                right: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      mood,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
