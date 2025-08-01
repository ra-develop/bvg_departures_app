import 'package:flutter/material.dart';

/// This file defines the color constants used throughout the app.
/// The colors are now based on the design requirements with primary blues,
/// secondary reds, and comprehensive semantic colors.
class AppColors {
  // Primitive Colors
  static const baseBlack = Color(0xFF191F25); // Base/Black
  static const baseWhite = Color(0xFFFFFFFF); // Base/White

  // Greys
  static const greys50 = Color(0xFFF4F8FC); // Greys/S0
  static const greys100 = Color(0xFFEDF1F5); // Greys/R00
  static const greys300 = Color(0xFFC5CFDB); // Greys/S00
  static const greys500 = Color(0xFF7B8694); // Greys/S00
  static const greys600 = Color(0xFF666F7A); // Greys/R00
  static const greys800 = Color(0xFF3A3F45); // Greys/S00

  // Primary Colors
  static const primaryBlue600 = Color(0xFF2D6782); // Primary/Blue 600
  static const primaryBlue800 = Color(0xFF022063); // Primary/Blue 800
  static const primaryBlue900 = Color(0xFF011B30); // Primary/Blue 900

  // Secondary Colors
  static const secondaryRed600 = Color(0xFFDD3726); // Secondary/fixed 600
  static const secondaryRed700 = Color(0xFFC73224); // Secondary/fixed 700
  static const secondaryRed800 = Color(0xFF812C20); // Secondary/fixed 800

  // Semantic Colors - Background
  static const backgroundPrimary = baseWhite; // BackgroundPrimary
  static const backgroundSecondary = greys50; // BackgroundSecondary
  static const backgroundTertiary = greys100; // BackgroundTertiary

  static const backgroundInversePrimary =
      primaryBlue900; // BackgroundInversePrimary
  static const backgroundInverseSecondary =
      primaryBlue800; // BackgroundInverseSecondary

  static const backgroundSystemAttention =
      Color(0xFFBFBFC0); // BackgroundSystem/Attention
  static const backgroundSystemError =
      Color(0xFFFFE5EB); // BackgroundSystemError
  static const backgroundSystemInformative =
      Color(0xFFEAF3FE); // BackgroundSystemInformative
  static const backgroundSystemNeutral = greys100; // BackgroundSystem/Neutral
  static const backgroundSystemSuccess =
      Color(0xFFDEF8E3); // BackgroundSystem/Success

  // Semantic Colors - Border
  static const borderPrimary = baseBlack; // BorderPrimary
  static const borderSecondary = greys100; // BorderSecondary

  // Semantic Colors - Foreground
  static const foregroundPrimary = baseBlack; // ForegroundPrimary
  static const foregroundSecondary = greys800; // ForegroundSecondary
  static const foregroundTertiary = greys600; // ForegroundTertiary
  static const foregroundDisabled =
      Color(0x4D191F25); // ForegroundDisabled (30% opacity)

  static const foregroundInversePrimary = baseWhite; // ForegroundInversePrimary
  static const foregroundInverseSecondary =
      greys100; // ForegroundInverseSecondary

  static const foregroundSystemNeutral = greys600; // ForegroundSystem/Neutral
  static const foregroundSystemSuccess =
      Color(0xFF077237); // ForegroundSystem/Success
  static const foregroundSystemError =
      Color(0xFFBC1D3B); // ForegroundSystem/Error
  static const foregroundSystemAttention =
      Color(0xFFC27500); // ForegroundSystem/Attention
  static const foregroundSystemInformative =
      Color(0xFF0D4FA5); // ForegroundSystem/Informative

  // Semantic Colors - Interaction
  static const interactionPrimaryEnabled =
      secondaryRed600; // InteractionPrimaryEnabled
  static const interactionPrimaryPressed =
      secondaryRed700; // InteractionPrimaryPressed
  static const interactionPrimaryFocused =
      secondaryRed800; // InteractionPrimaryFocused
  static const interactionPrimaryHovered =
      secondaryRed700; // InteractionPrimaryHovered

  static const interactionSecondaryEnabled =
      primaryBlue900; // Interaction/SecondaryEnabled
  static const interactionSecondaryFocused =
      primaryBlue600; // Interaction/SecondaryFocused
  static const interactionSecondaryHovered =
      primaryBlue800; // Interaction/SecondaryHovered
  static const interactionSecondaryPressed =
      primaryBlue800; // Interaction/SecondaryPressed

  // Opacity
  static const opacity8 = Color(0x14000000); // Opacity/O-B8 (8%)
  static const opacity12 = Color(0x1F000000); // Opacity/O-12 (12%)
  static const opacity16 = Color(0x29000000); // Opacity/O-16 (16%)
}
