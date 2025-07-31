import 'package:bvg_departures_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// A widget that provides a delimiter for the AppBar.
/// It is used to visually separate the AppBar from the content below it.
/// This widget can be used in various screens to maintain a consistent look.
/// It is a simple [PreferredSize] widget with a fixed height and a background color.
/// It is typically used in the AppBar's bottom property.
/// It can be customized with different colors if needed.
/// Example usage:
/// ```dart
/// AppBar(
///   title: Text('My App'),
///   bottom: appBarDelimiter(),
/// )
/// ```
PreferredSize appBarDelimiter() {
  return PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.borderPrimary,
        height: 1.0,
      ));
}
