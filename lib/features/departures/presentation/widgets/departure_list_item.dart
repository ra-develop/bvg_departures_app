import 'package:bvg_departures_app/core/constants/app_colors.dart';
import 'package:bvg_departures_app/features/departures/data/models/departure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget that displays a departure list item.
/// This widget shows the departure information including the line, destination,
/// platform, time, and delay status.
/// It uses a combination of text and icons to represent the departure details.
/// The layout is responsive and adapts to different screen sizes.
class DepartureListItem extends StatelessWidget {
  final Departure departure;

  const DepartureListItem({super.key, required this.departure});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDelayed = departure.delay != null && departure.delay! > 0;
    final delayText = isDelayed ? ' ${departure.delay}m' : 'unknown';

    return Container(
      constraints: const BoxConstraints(minHeight: 80),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          // Left content (icon and text)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First line: Line and destination
                Row(
                  children: [
                    _getTransportIcon(departure.line?.product),
                    const SizedBox(width: 2),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        border:
                            Border.all(color: AppColors.onSurface, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        departure.line?.name ?? 'Unknown line',
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Second line: Station
                Text(
                  departure.stop?.name ?? 'Unknown station',
                  // maxLines: 1,
                  // overflow: TextOverflow.visible,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: AppColors.onSecondary,
                  ),
                ),
                const SizedBox(height: 2),
                // Third line: Direction Station and platform
                Text(
                  '${departure.destination?.name ?? 'Unknown direction'} • Platform ${departure.platform ?? '?'}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.onSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Right content (time and status)
          Container(
            decoration: BoxDecoration(
              color: isDelayed ? AppColors.error : AppColors.success,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: 80,
              height: 80, // Fixed height for the right side
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Spacer(),
                  Text(
                    departure.formattedWhen,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color:
                          isDelayed ? AppColors.onError : AppColors.onSuccess,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isDelayed ? 'delayed\n$delayText' : 'on-time',
                    maxLines: 2,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color:
                          isDelayed ? AppColors.onError : AppColors.onSuccess,
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        ],
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
      width: 24,
      height: 24,
    );
  }
}
