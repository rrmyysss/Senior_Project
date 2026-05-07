import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/organisms/custom_bottom_nav_bar.dart';

const _kPlaylists = [
  {
    'name': 'Enerjik Sabahlar',
    'tag': 'Enerjik ⚡',
    'count': 24,
    'g1': 0xFFF4A261,
    'g2': 0xFFD97706,
    'em': '🌅',
    'tagBg': 0xFFFEF3C7,
    'tagFg': 0xFFD97706,
  },
  {
    'name': 'Sakin Yürüyüşler',
    'tag': 'Sakin 🌿',
    'count': 18,
    'g1': 0xFF6AAB7A,
    'g2': 0xFF4A7C59,
    'em': '🌲',
    'tagBg': 0xFFD1FAE5,
    'tagFg': 0xFF065F46,
  },
  {
    'name': 'Yaz Neşesi',
    'tag': 'Mutlu 😊',
    'count': 42,
    'g1': 0xFFC4B5FD,
    'g2': 0xFFA78BFA,
    'em': '☀️',
    'tagBg': 0xFFFCE7F3,
    'tagFg': 0xFFBE185D,
  },
  {
    'name': 'Yağmurlu Günler',
    'tag': 'Hüzünlü 🌧',
    'count': 15,
    'g1': 0xFF374151,
    'g2': 0xFF111827,
    'em': '🌧',
    'tagBg': 0xFFE0E7FF,
    'tagFg': 0xFF3730A3,
  },
  {
    'name': 'Derin Odaklanma',
    'tag': 'Odak 🧠',
    'count': 30,
    'g1': 0xFF7C6A50,
    'g2': 0xFF3D2F1A,
    'em': '☕',
    'tagBg': 0xFFE0F2FE,
    'tagFg': 0xFF0369A1,
  },
];

class LastPlaylistPage extends StatefulWidget {
  const LastPlaylistPage({super.key});

  @override
  State<LastPlaylistPage> createState() => _LastPlaylistPageState();
}

class _LastPlaylistPageState extends State<LastPlaylistPage> {
  final List<String> _filters = ['Tümü', 'Bugün', 'Bu Hafta', 'Bu Ay'];
  String _selectedFilter = 'Tümü';

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
                  padding: const EdgeInsets.fromLTRB(22, 50, 22, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top bar
                      Row(
                        children: [
                          _CircleBackButton(onTap: () => Navigator.of(context).pop()),
                          const SizedBox(width: 16),
                          const Text(
                            'Son Çalınanlar',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF1A2A3A),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Filter chips
                      Wrap(
                        spacing: 10,
                        children: _filters.map((f) {
                          final isOn = f == _selectedFilter;
                          return GestureDetector(
                            onTap: () => setState(() => _selectedFilter = f),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                              decoration: BoxDecoration(
                                gradient: isOn
                                    ? const LinearGradient(
                                        colors: [Color(0xFFA78BFA), Color(0xFF7C6ADC)],
                                      )
                                    : null,
                                color: isOn ? null : Colors.white.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: isOn
                                    ? [
                                        BoxShadow(
                                          color: const Color(0xFF8264F0).withValues(alpha: 0.3),
                                          blurRadius: 12,
                                          offset: const Offset(0, 4),
                                        )
                                      ]
                                    : [],
                              ),
                              child: Text(
                                f,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: isOn ? Colors.white : const Color(0xFF6A8AAA),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),

                      // Playlist list
                      Column(
                        children: _kPlaylists.map((p) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _LastPlaylistCard(
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

class _LastPlaylistCard extends StatelessWidget {
  final String name;
  final String tag;
  final int count;
  final Color c1;
  final Color c2;
  final String em;
  final Color tagBg;
  final Color tagFg;
  final VoidCallback onTap;

  const _LastPlaylistCard({
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
              width: 68,
              height: 68,
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
                ],
              ),
            ),
            // Count + arrow
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$count Şarkı',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF8AAAC8),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '›',
                  style: TextStyle(fontSize: 20, color: Color(0xFF8AAAC8)),
                ),
              ],
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
