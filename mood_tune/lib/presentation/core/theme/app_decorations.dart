import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppDecorations {
  // Primary buton gradient (btn-grad)
  static const primaryGradient = LinearGradient(
    colors: [AppColors.gradientStart, AppColors.gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
  );

  // Mor düz buton
  static BoxDecoration primaryButton = BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(50),
    boxShadow: const [BoxShadow(color: AppColors.shadow, blurRadius: 10, offset: Offset(0, 4))],
  );

  // Kart dekorasyon
  static BoxDecoration card = BoxDecoration(
    color: AppColors.bgCard,
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [BoxShadow(color: AppColors.shadow, blurRadius: 12, offset: Offset(0, 4))],
  );
}
