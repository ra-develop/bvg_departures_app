import 'package:bvg_departures_app/features/stops/data/models/stop.dart';
import 'package:bvg_departures_app/features/stops/presentation/providers/stops_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Stops')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TypeAheadField<Stop>(
          suggestionsCallback: (pattern) async {
            if (pattern.isEmpty) return [];
            return await ref.read(stopsProvider(pattern).future);
          },
          builder: (context, controller, focusNode) {
            return TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: const InputDecoration(
                labelText: 'Search for a BVG stop',
                border: OutlineInputBorder(),
              ),
            );
          },
          itemBuilder: (context, Stop stop) {
            return ListTile(
              title: Text(stop.name ?? 'No name',
                  style: Theme.of(context).textTheme.bodyLarge),
            );
          },
          onSelected: (Stop stop) {
            context.go('/departures/${stop.id}');
          },
          hideOnEmpty: true,
        ),
      ),
    );
  }
}
