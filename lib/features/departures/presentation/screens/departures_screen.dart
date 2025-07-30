import 'package:bvg_departures_app/features/departures/presentation/providers/departures_provider.dart';
import 'package:bvg_departures_app/features/departures/presentation/widgets/departure_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DeparturesScreen extends ConsumerWidget {
  final String stopId;
  final String stopName;

  const DeparturesScreen(
      {super.key, required this.stopId, required this.stopName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departuresAsync = ref.watch(departuresProvider(stopId));

    return Scaffold(
      appBar: AppBar(
        title: Text(stopName),
        actions: [
          IconButton(
            icon:
                SvgPicture.asset('assets/svg/close.svg', width: 24, height: 24),
            onPressed: () => context.go('/'),
          ),
        ],
      ),
      body: departuresAsync.when(
        data: (departures) => ListView.separated(
          itemCount: departures.length,
          itemBuilder: (context, index) =>
              DepartureListItem(departure: departures[index]),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
