import 'package:bvg_departures_app/features/stops/data/models/stop.dart';
import 'package:flutter/material.dart';

class StopSearchListItem extends StatelessWidget {
  final Stop stop;

  const StopSearchListItem({
    super.key,
    required this.stop,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(stop.name ?? 'No name',
          style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
