import 'package:bvg_departures_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        leading: _getTransportIcon(departure.line?.product),
        title: Text(
          '${departure.line?.name} to ${departure.direction}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Text(
          'Departs at ${departure.formattedWhen}${departure.delay != 0 || departure.delay != null ? ' (${departure.delay}m)' : ''}',
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

  /// Returns an icon based on the transport type.
  /// Supported types:
  /// - suburban: S-Bahn
  /// - subway: U-Bahn
  /// - tram: Tram
  /// - bus: Bus
  /// - ferry: Fähre
  /// - express: IC/ICE
  /// - regional: RB/RE
  /// If the type is not recognized, a placeholder icon is returned.
  Widget _getTransportIcon(String? type) {
    String iconPath;
    switch (type?.toLowerCase()) {
      case 'suburban':
        iconPath = 'assets/svg/suburban.svg';
        break;
      case 'subway':
        iconPath = 'assets/svg/subway.svg';
        break;
      case 'tram':
        iconPath = 'assets/svg/tram.svg';
        break;
      case 'bus':
        iconPath = 'assets/svg/bus.svg';
        break;
      case 'ferry':
        iconPath = 'assets/svg/ferry.svg';
        break;
      case 'express':
        iconPath = 'assets/svg/express.svg';
        break;
      case 'regional':
        iconPath = 'assets/svg/regional.svg';
        break;
      default:
        iconPath = 'assets/svg/placeholder.svg';
    }
    return SvgPicture.asset(
      iconPath,
      width: 48.0,
      height: 48.0,
      // colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
    );
  }
}
