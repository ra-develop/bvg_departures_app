import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BVG Departures')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/search'),
          child: const Text('Search for a Stop'),
        ),
      ),
    );
  }
}
