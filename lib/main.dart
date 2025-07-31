import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/providers/router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: BvgDeparturesApp()));
}

class BvgDeparturesApp extends ConsumerWidget {
  const BvgDeparturesApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'BVG Departures',

      /// The theme of the app is set to light mode.
      /// This theme includes custom colors, text styles, and other visual elements.
      /// It is defined in the app's core theme file.
      /// The theme is applied globally to ensure a consistent look and feel across the app.
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
