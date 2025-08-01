import 'package:bvg_departures_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// A class that defines the app's theme.
/// It includes the primary color, text styles, and other theme-related properties.
/// This class can be used to apply a consistent theme across the app.
/// The theme is based on the BVG (Berliner Verkehrsbetriebe) branding,
/// which includes a primary blue color and various text styles.
/// Example usage:
/// ```dart
/// final theme = AppTheme.lightTheme;
/// MaterialApp(
///   theme: theme,
///   home: MyHomePage(),
/// );
/// ```
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryBlue800,
      scaffoldBackgroundColor: AppColors.backgroundPrimary,
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
        headlineMedium: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 24.0,
          height: 28.0 / 24.0, // 24.0 line height
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 20.0,
          height: 24.0 / 20.0, // 28.0 line height
        ),
        titleLarge: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800, // Medium
          fontSize: 24.0,
          height: 28.0 / 24.0, // 28.0 line height
        ),
        titleMedium: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800, // Medium
          fontSize: 20.0,
          height: 24.0 / 20.0, // 24.0 line height
        ),
        titleSmall: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 16.0,
          height: 24.0 / 16.0, // 24.0 line height
        ),
        labelLarge: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 14.0,
          height: 20.0 / 14.0, // 20.0 line height (Flutter interprets as 1.0)
        ),
        labelMedium: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 12.0,
          height: 16.0 / 12.0, // 16.0 line height
        ),
        labelSmall: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600, // SemiBold
          fontSize: 11.0,
          height: 16.0 / 11.0, // 16.0 line height
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Inter',
          fontWeight:
              FontWeight.normal, // Regular (approximating Inter default)
          fontSize: 16.0,
          height: 24.0 / 16.0, // 24.0 line height
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal, // Regular
          fontSize: 14.0,
          height: 20.0 / 14.0, // 20.0 line height
        ),
        bodySmall: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal, // Regular
          fontSize: 12.0,
          height: 16.0 / 12.0, // 16.0 line height
        ),
      ),
    );
  }
}
