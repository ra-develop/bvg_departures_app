import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/departures_provider.dart';
import '../widgets/departure_list_item.dart';

class DeparturesScreen extends ConsumerWidget {
  final String stopId;

  const DeparturesScreen({super.key, required this.stopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departuresAsync = ref.watch(departuresProvider(stopId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Departures'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.go('/search'),
          ),
        ],
      ),
      body: departuresAsync.when(
        data: (departures) => ListView.builder(
          itemCount: departures.length,
          itemBuilder: (context, index) =>
              DepartureListItem(departure: departures[index]),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
