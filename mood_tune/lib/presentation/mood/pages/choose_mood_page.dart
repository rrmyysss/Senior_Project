import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/atoms/app_text_field.dart';
import '../../core/atoms/mood_chip.dart';
import '../../core/organisms/custom_bottom_nav_bar.dart';
import '../../core/atoms/gradient_scaffold.dart';

class ChooseMoodPage extends StatefulWidget {
  const ChooseMoodPage({super.key});

  @override
  State<ChooseMoodPage> createState() => _ChooseMoodPageState();
}

class _ChooseMoodPageState extends State<ChooseMoodPage> {
  String? _selectedMood;

  final List<Map<String, String>> _moods = [
    {'text': 'Mutlu', 'emoji': '😊'},
    {'text': 'Hüzünlü', 'emoji': '😢'},
    {'text': 'Sinirli', 'emoji': '😠'},
    {'text': 'Sakin', 'emoji': '🌙'},
    {'text': 'Enerjik', 'emoji': '⚡'},
    {'text': 'Yorgun', 'emoji': '😴'},
    {'text': 'Aşık', 'emoji': '😍'},
    {'text': 'Kaygılı', 'emoji': '😰'},
    {'text': 'Heyecanlı', 'emoji': '🤩'},
    {'text': 'Melankolik', 'emoji': '🍂'},
    {'text': 'Özgüvenli', 'emoji': '😎'},
    {'text': 'Coşkulu', 'emoji': '🎉'},
    {'text': 'Odaklanmış', 'emoji': '🎯'},
    {'text': 'Uykulu', 'emoji': '🥱'},
    {'text': 'Rahat', 'emoji': '😌'},
    {'text': 'Nostaljik', 'emoji': '📻'},
  ];

  late List<Map<String, String>> _filteredMoods;

  @override
  void initState() {
    super.initState();
    _filteredMoods = List.from(_moods);
  }

  String _normalizeTurkish(String text) {
    return text
        .replaceAll('ı', 'i')
        .replaceAll('ğ', 'g')
        .replaceAll('ü', 'u')
        .replaceAll('ş', 's')
        .replaceAll('ö', 'o')
        .replaceAll('ç', 'c')
        .replaceAll('İ', 'i')
        .replaceAll('Ğ', 'g')
        .replaceAll('Ü', 'u')
        .replaceAll('Ş', 's')
        .replaceAll('Ö', 'o')
        .replaceAll('Ç', 'c');
  }

  void _filterMoods(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredMoods = List.from(_moods);
      });
      return;
    }

    final normalizedQuery = _normalizeTurkish(query.toLowerCase());
    setState(() {
      _filteredMoods = _moods.where((mood) {
        final normalizedMood = _normalizeTurkish(mood['text']!.toLowerCase());
        return normalizedMood.contains(normalizedQuery);
      }).toList();
    });
  }

  void _onMoodSelected(String mood) {
    setState(() {
      _selectedMood = mood;
    });
    // Kısa bir bekleme sonrası yönlendirme
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        context.push('/choose-playlist');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Ruh Halini Seç', style: AppTextStyles.displayM.copyWith(fontSize: 28)),
              const SizedBox(height: 8),
              Text(
                'Bugün nasıl hissediyorsun?',
                style: AppTextStyles.bodyM.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 32),
              
              AppTextField(
                hintText: 'Ruh hali ara...',
                prefixIcon: const Icon(Icons.search, color: AppColors.textHint),
                onChanged: _filterMoods,
              ),
              const SizedBox(height: 32),
              
              Wrap(
                spacing: 12,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: _filteredMoods.map((mood) {
                  return MoodChip(
                    text: mood['text']!,
                    emoji: mood['emoji']!,
                    isSelected: _selectedMood == mood['text'],
                    onTap: () => _onMoodSelected(mood['text']!),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1, // Keşfet Aktif
        onTap: (index) {
          if (index == 0) context.go('/home');
          if (index == 2) context.pushReplacement('/my-playlists');
          if (index == 3) context.pushReplacement('/profile');
        },
      ),
    );
  }
}
