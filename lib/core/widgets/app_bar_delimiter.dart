import 'package:bvg_departures_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

PreferredSize appBarDelimiter() {
  return PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.borderPrimary,
        height: 1.0,
      ));
}
