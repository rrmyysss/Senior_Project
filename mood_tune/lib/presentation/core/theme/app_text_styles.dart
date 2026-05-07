import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static TextStyle get displayXL  => GoogleFonts.nunito(fontSize: 32, fontWeight: FontWeight.w900, color: AppColors.textPrimary);
  static TextStyle get displayL   => GoogleFonts.nunito(fontSize: 26, fontWeight: FontWeight.w900, color: AppColors.textPrimary);
  static TextStyle get displayM   => GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.textPrimary);
  static TextStyle get titleL     => GoogleFonts.nunito(fontSize: 19, fontWeight: FontWeight.w900, color: AppColors.textPrimary);
  static TextStyle get titleM     => GoogleFonts.nunito(fontSize: 17, fontWeight: FontWeight.w900, color: AppColors.textPrimary);
  static TextStyle get bodyL      => GoogleFonts.nunito(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textSecondary);
  static TextStyle get bodyM      => GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textSecondary);
  static TextStyle get label      => GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.textSecondary);
  static TextStyle get chip       => GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w800, color: AppColors.textPrimary);
  static TextStyle get button     => GoogleFonts.nunito(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white);
}
