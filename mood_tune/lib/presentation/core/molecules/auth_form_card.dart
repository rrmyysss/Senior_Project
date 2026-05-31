import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AuthFormCard extends StatelessWidget {
  final List<Widget> children;
  final String bottomText;
  final String bottomActionText;
  final VoidCallback onBottomActionTap;

  const AuthFormCard({
    super.key,
    required this.children,
    required this.bottomText,
    required this.bottomActionText,
    required this.onBottomActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.bgMain, // Veya gradient istendiyse gradient eklenebilir. Arka plan.
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...children,
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bottomText,
                      style: AppTextStyles.bodyM.copyWith(color: AppColors.textSecondary),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: onBottomActionTap,
                      child: Text(
                        bottomActionText,
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
