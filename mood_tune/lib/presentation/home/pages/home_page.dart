import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/atoms/gradient_scaffold.dart';
import '../../core/organisms/scan_card.dart';

const _kRecentItems = [
  {'name': 'Sabah Neşesi', 'tag': 'Mutlu 😊', 'bg': 0xFFF0E6D8, 'em': '🎨'},
  {'name': 'Akşamüstü Kahvesi', 'tag': 'Sakin ☕', 'bg': 0xFFD8CBB8, 'em': '☕'},
  {'name': 'Derin Odak', 'tag': 'Üretken 💡', 'bg': 0xFFC8D4C0, 'em': '💡'},
];

const _kSpecialItems = [
  {
    'name': 'Doğa Sesleri',
    'mood': 'Rahatlama',
    'g1': 0xFF3D6B4A,
    'g2': 0xFF5A9668,
    'songs': ['Rain on Leaves', 'Forest Wind', 'River Flow', 'Bird Songs'],
    'artists': ['Nature', 'Nature', 'Nature', 'Nature'],
  },
  {
    'name': 'Gece Sürüşü',
    'mood': 'Melankolik',
    'g1': 0xFF1E2D4E,
    'g2': 0xFF3A4F7A,
    'songs': ['Midnight City', 'Outro', 'Midnight', 'Breathe'],
    'artists': ['M83', 'M83', 'Coldplay', 'Pink Floyd'],
  },
  {
    'name': 'Haftasonu',
    'mood': 'Parti',
    'g1': 0xFFE8D0B8,
    'g2': 0xFFC4956A,
    'songs': ['Blinding Lights', 'Levitating', 'As It Was', 'Watermelon Sugar'],
    'artists': ['The Weeknd', 'Dua Lipa', 'Harry Styles', 'Harry Styles'],
  },
  {
    'name': 'Yoga Akışı',
    'mood': 'Wellness',
    'g1': 0xFFC8E0C4,
    'g2': 0xFF90BC88,
    'songs': ['Breathe', 'Calm', 'Inner Peace', 'Balance'],
    'artists': ['Meditation', 'Relax', 'Zen', 'Harmony'],
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = FirebaseAuth.instance.currentUser?.displayName?.split(' ').first ?? 'Kullanıcı';
    return GradientScaffold(
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
                    Text(
                      'Merhaba, $userName 👋',
                      style: AppTextStyles.displayM.copyWith(fontSize: 24),
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

              // ── Son Çalınanlar ────────────────────────────────
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
                      onTap: () => context.push('/last-playlist'),
                      child: const Text(
                        'Tümünü Göster',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF8AAAC8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 176,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  itemCount: _kRecentItems.length,
                  itemBuilder: (context, i) {
                    final item = _kRecentItems[i];
                    return _RecentCard(
                      name: item['name'] as String,
                      tag: item['tag'] as String,
                      bg: Color(item['bg'] as int),
                      em: item['em'] as String,
                    );
                  },
                ),
              ),
              const SizedBox(height: 28),

              // ── Sana Özel ─────────────────────────────────────
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: _kSpecialItems.length,
                  itemBuilder: (context, i) {
                    final item = _kSpecialItems[i];
                    return _SpecialCard(
                      name: item['name'] as String,
                      mood: item['mood'] as String,
                      c1: Color(item['g1'] as int),
                      c2: Color(item['g2'] as int),
                      songs: item['songs'] as List<String>,
                      artists: item['artists'] as List<String>,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecentCard extends StatelessWidget {
  final String name;
  final String tag;
  final Color bg;
  final String em;

  const _RecentCard({
    required this.name,
    required this.tag,
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

class _SpecialCard extends StatelessWidget {
  final String name;
  final String mood;
  final Color c1;
  final Color c2;
  final List<String> songs;
  final List<String> artists;

  const _SpecialCard({
    required this.name,
    required this.mood,
    required this.c1,
    required this.c2,
    required this.songs,
    required this.artists,
  });

  void _showSongList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFF1A2A3A))),
            Text(mood, style: const TextStyle(fontSize: 13, color: Color(0xFF8AAAC8), fontWeight: FontWeight.w600)),
            const SizedBox(height: 20),
            ...List.generate(songs.length, (i) => _SongRow(title: songs[i], artist: artists[i])),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSongList(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [c1, c2],
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withValues(alpha: 0.55), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.0, 0.55],
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
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      mood,
                      style: TextStyle(
                        fontSize: 11,
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

class _SongRow extends StatelessWidget {
  final String title;
  final String artist;
  const _SongRow({required this.title, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF7C4DFF).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.music_note, color: Color(0xFF7C4DFF)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF1A2A3A))),
                Text(artist, style: const TextStyle(fontSize: 12, color: Color(0xFF8AAAC8))),
              ],
            ),
          ),
          const Icon(Icons.play_circle_outline, color: Color(0xFF7C4DFF), size: 28),
        ],
      ),
    );
  }
}
