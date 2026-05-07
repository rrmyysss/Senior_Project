import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class MoodTagBadge extends StatelessWidget {
  final String text;
  final String emoji;
  final Color backgroundColor;
  final Color textColor;

  const MoodTagBadge({
    super.key,
    required this.text,
    required this.emoji,
    required this.backgroundColor,
    required this.textColor,
  });

  factory MoodTagBadge.fromMood(String moodName) {
    // Örnek renk mapping
    switch (moodName.toLowerCase()) {
      case 'mutlu':
        return const MoodTagBadge(text: 'Mutlu', emoji: '😊', backgroundColor: Color(0xFFFFF3B0), textColor: Color(0xFF92400E));
      case 'sakin':
        return const MoodTagBadge(text: 'Sakin', emoji: '🌙', backgroundColor: Color(0xFFDCFCE7), textColor: Color(0xFF065F46));
      case 'enerjik':
        return const MoodTagBadge(text: 'Enerjik', emoji: '⚡', backgroundColor: Color(0xFFFFEDD5), textColor: Color(0xFF9A3412));
      case 'hüzünlü':
        return const MoodTagBadge(text: 'Hüzünlü', emoji: '😢', backgroundColor: Color(0xFFDBEAFE), textColor: Color(0xFF1E40AF));
      case 'odak':
        return const MoodTagBadge(text: 'Odak', emoji: '🎯', backgroundColor: Color(0xFFEDE9FE), textColor: Color(0xFF4C1D95));
      case 'ciddi':
        return const MoodTagBadge(text: 'Ciddi', emoji: '😐', backgroundColor: Color(0xFFF3F4F6), textColor: Color(0xFF374151));
      case 'keyifli':
        return const MoodTagBadge(text: 'Keyifli', emoji: '😌', backgroundColor: Color(0xFFFCE7F3), textColor: Color(0xFF831843));
      case 'çılgın':
        return const MoodTagBadge(text: 'Çılgın', emoji: '🤪', backgroundColor: Color(0xFFFEF3C7), textColor: Color(0xFF92400E));
      default:
        return const MoodTagBadge(text: 'Nötr', emoji: '😶', backgroundColor: AppColors.divider, textColor: AppColors.textPrimary);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 4),
          Text(
            text,
            style: AppTextStyles.label.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
