import 'package:bvg_departures_app/core/widgets/app_bar_delimiter.dart';
import 'package:bvg_departures_app/features/departures/presentation/providers/departures_provider.dart';
import 'package:bvg_departures_app/features/departures/presentation/widgets/departure_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

/// A screen that displays departures for a specific stop.
/// This screen is part of the departures feature in the BVG Departures App.
/// It uses the Riverpod state management library to fetch and display departures.
/// The screen includes an AppBar with the stop name and a close button.
/// The body of the screen shows a list of departures, each represented by a
/// DepartureListItem widget.
/// The departures are fetched using the departuresProvider, which retrieves
/// a list of Departure objects based on the provided stop ID.
/// The screen handles loading and error states using the FutureProvider's
/// `when` method, displaying a loading indicator while fetching data and
/// an error message if the fetch fails.
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
        bottom: appBarDelimiter(),
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
