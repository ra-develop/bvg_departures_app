import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'router.dart';
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
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
