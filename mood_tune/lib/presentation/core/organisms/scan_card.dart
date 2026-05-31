import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ScanCard extends StatelessWidget {
  final VoidCallback onScanTap;

  const ScanCard({
    super.key,
    required this.onScanTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95), // Highly opaque white
        borderRadius: BorderRadius.circular(32), // Large radius
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Icon Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.bgMain, // Light gray for icon background
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt_rounded,
              size: 28,
              color: AppColors.textPrimary, // Dark icon
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Duygunu Tara',
            style: AppTextStyles.titleL.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Bugünkü modunu keşfetmek\niçin yüzünü tarat',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyM.copyWith(color: AppColors.textHint, height: 1.4, fontSize: 13),
          ),
          const SizedBox(height: 28),
          OutlinedButton(
            onPressed: onScanTap,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: const BorderSide(color: AppColors.divider, width: 1),
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Tara', style: AppTextStyles.label.copyWith(color: AppColors.textPrimary, fontSize: 14)),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.textPrimary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
