import 'package:bvg_departures_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.surface,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 40.0,
          height: 48.0 / 40.0, // 48.0 line height
        ),
        displayMedium: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 36.0,
          height: 42.0 / 36.0, // 42.0 line height
        ),
        displaySmall: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 32.0,
          height: 38.0 / 32.0, // 38.0 line height
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 28.0,
          height: 32.0 / 28.0, // 32.0 line height
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 24.0,
          height: 24.0 / 24.0, // 24.0 line height
        ),
        titleLarge: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500, // Medium
          fontSize: 24.0,
          height: 24.0 / 24.0, // 24.0 line height
        ),
        titleMedium: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500, // Medium
          fontSize: 20.0,
          height: 24.0 / 20.0, // 24.0 line height
        ),
        titleSmall: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 16.0,
          height: 4.0 / 16.0, // 4.0 line height
        ),
        labelLarge: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 14.0,
          height: 0.0 / 14.0, // 0.0 line height (Flutter interprets as 1.0)
        ),
        labelMedium: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 12.0,
          height: 4.0 / 12.0, // 4.0 line height
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400, // Regular (approximating Inter default)
          fontSize: 16.0,
          height: 4.0 / 16.0, // 4.0 line height
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400, // Regular
          fontSize: 14.0,
          height: 0.0 / 14.0, // 0.0 line height (Flutter interprets as 1.0)
        ),
        bodySmall: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400, // Regular
          fontSize: 12.0,
          height: 4.0 / 12.0, // 4.0 line height
        ),
      ),
    );
  }
}
