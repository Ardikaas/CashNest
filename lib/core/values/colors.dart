import 'package:flutter/material.dart';

class AppColors {
  // Base Colors
  static const Color background = Color(0xFFF5F6FA);
  static const Color white = Colors.white;

  // Primary (Blue)
  static const Color primary = Color(0xFF1E50DE);
  static const Color primaryBg = Color(0xFFD6E4FF);

  // Text Colors
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);

  // Status/Wallet Colors
  // 1. Tabungan (Blue - reusing primary)
  static const Color tabunganIcon = Color(0xFF1E50DE);
  static const Color tabunganBg = Color(0xFFD6E4FF);

  // 2. Dana Darurat (Red)
  static const Color daruratIcon = Color(0xFFEF4444);
  static const Color daruratBg = Color(0xFFFCECDD);

  // 3. Harian (Orange)
  static const Color harianIcon = Color(0xFFF59E0B);
  static const Color harianBg = Color(0xFFFEF3C7);

  // 4. Investasi (Green)
  static const Color investasiIcon = Color(0xFF10B981);
  static const Color investasiBg = Color(0xFFD1FAE5);

  // Badges
  static const Color badgeGreenText = Color(0xFF047857);
  static const Color badgeGreenBg = Color(0xFFD1FEF1);
}
