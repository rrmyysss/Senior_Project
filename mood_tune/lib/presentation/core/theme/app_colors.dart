import 'package:flutter/material.dart';

abstract class AppColors {
  // Ana Renkler (React'teki mor)
  static const primary       = Color(0xFFA855F7); // Vibrant purple
  static const primaryLight  = Color(0xFFC084FC); 
  static const primaryDark   = Color(0xFF7E22CE); 

  // Arka Plan
  static const bgMain        = Color(0xFFF3F4F6); // Soft gray/white
  static const bgCard        = Colors.white; 
  static const bgCardAlt     = Color(0xFFF8FAFC); 

  // Metin
  static const textPrimary   = Color(0xFF1F2937); // Dark gray/black
  static const textSecondary = Color(0xFF6B7280); // Gray
  static const textHint      = Color(0xFF9CA3AF); // Light gray

  // Duygu Renkleri (Tag renkleri)
  static const moodHappy     = Color(0xFF8B5CF6); // Defaulting to vibrant purple active
  static const moodSad       = Color(0xFF4895EF); 
  static const moodAngry     = Color(0xFFE63946); 
  static const moodFear      = Color(0xFF7B2D8B); 
  static const moodSurprise  = Color(0xFFF77F00); 
  static const moodNeutral   = Color(0xFF6B7280); 
  static const moodEnergetic = Color(0xFFFF6B35); 
  static const moodCalm      = Color(0xFF2EC4B6); 
  static const moodFocus     = Color(0xFF3A86FF); 
  static const moodParty     = Color(0xFFFF006E); 

  // Gradient 
  static const gradientStart = Color(0xFFE9D5FF); // Soft purple bg top
  static const gradientEnd   = Color(0xFFBFDBFE); // Soft blue bg bottom

  // Utility
  static const divider       = Color(0xFFE5E7EB);
  static const shadow        = Color(0x1A000000); // Very light black shadow a=0.1
}
