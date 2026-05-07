import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/organisms/custom_bottom_nav_bar.dart';

const _kPlaylists = [
  {
    'name': 'Sabah Enerjisi ☀️',
    'tag': 'Enerjik',
    'count': 14,
    'g1': 0xFF7EC8E3,
    'g2': 0xFF4A90D9,
    'em': '🌊',
    'tagBg': 0xFFFEF3C7,
    'tagFg': 0xFFD97706,
  },
  {
    'name': 'Pozitif Titreşimler ✨',
    'tag': 'Neşeli',
    'count': 20,
    'g1': 0xFFF8B0D8,
    'g2': 0xFFF06090,
    'em': '✨',
    'tagBg': 0xFFFCE7F3,
    'tagFg': 0xFFBE185D,
  },
  {
    'name': 'Akşam Yürüyüşü 🎧',
    'tag': 'Sakin',
    'count': 18,
    'g1': 0xFFF4A261,
    'g2': 0xFFE07040,
    'em': '🌆',
    'tagBg': 0xFFD1FAE5,
    'tagFg': 0xFF065F46,
  },
];

class ScanResultPage extends StatelessWidget {
  const ScanResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          _CircleBackButton(onTap: () => context.go('/home')),
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
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              'Duygun Tarandı!',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF1A2A3A),
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Müziğin seninle aynı frekansta.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF8AAAC8),
                              ),
                            ),
                            SizedBox(height: 14),
                            _MoodBadge(label: 'Mutlu'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Playlists label
                      const Text(
                        'Sana Özel Playlist\'ler',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF1A2A3A),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Playlist cards
                      Column(
                        children: _kPlaylists.map((p) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _PlaylistCard(
                              name: p['name'] as String,
                              tag: p['tag'] as String,
                              count: p['count'] as int,
                              c1: Color(p['g1'] as int),
                              c2: Color(p['g2'] as int),
                              em: p['em'] as String,
                              tagBg: Color(p['tagBg'] as int),
                              tagFg: Color(p['tagFg'] as int),
                              onTap: () => context.push('/choose-playlist'),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom nav
            CustomBottomNavBar(
              currentIndex: 0,
              onTap: (index) {
                if (index == 0) context.go('/home');
                if (index == 1) context.pushReplacement('/choose-mood');
                if (index == 2) context.pushReplacement('/my-playlists');
                if (index == 3) context.pushReplacement('/profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}

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

class _PlaylistCard extends StatelessWidget {
  final String name;
  final String tag;
  final int count;
  final Color c1;
  final Color c2;
  final String em;
  final Color tagBg;
  final Color tagFg;
  final VoidCallback onTap;

  const _PlaylistCard({
    required this.name,
    required this.tag,
    required this.count,
    required this.c1,
    required this.c2,
    required this.em,
    required this.tagBg,
    required this.tagFg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.65),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Thumbnail
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [c1, c2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(em, style: const TextStyle(fontSize: 26)),
              ),
            ),
            const SizedBox(width: 14),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1A2A3A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: tagBg,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: tagFg,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '• $count Şarkı',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF8AAAC8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Play button
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFA78BFA), Color(0xFF7C6ADC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.play_arrow, color: Colors.white, size: 18),
              ),
            ),
          ],
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
          child: Text('←', style: TextStyle(fontSize: 20, color: Color(0xFF1A2A3A))),
        ),
      ),
    );
  }
}
