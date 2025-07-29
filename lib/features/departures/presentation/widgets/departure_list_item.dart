import 'package:bvg_departures_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../data/models/departure.dart';

class DepartureListItem extends StatelessWidget {
  final Departure departure;

  const DepartureListItem({super.key, required this.departure});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: AppColors.stateLayer,
            blurRadius: 2.0,
          ),
        ],
      ),
      child: ListTile(
        leading: _getTransportIcon(departure.line?.mode),
        title: Text(
          '${departure.line?.name} to ${departure.direction}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Text(
          'Departs at ${departure.formattedWhen}${departure.delay != 0 ? ' (+${departure.delay}m)' : ''}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: departure.platform != null
            ? Text(
                'Platform ${departure.platform}',
                style: Theme.of(context).textTheme.labelMedium,
              )
            : null,
      ),
    );
  }

  Widget _getTransportIcon(String? type) {
    switch (type?.toLowerCase()) {
      case 'bus':
        return const Icon(Icons.directions_bus);
      case 'tram':
        return const Icon(Icons.tram);
      case 'ubahn':
        return const Icon(Icons.subway);
      case 'sbahn':
        return const Icon(Icons.train);
      default:
        return const Icon(Icons.directions);
    }
  }
}
