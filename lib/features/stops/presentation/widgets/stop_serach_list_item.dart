import 'package:bvg_departures_app/core/data/models/products.dart';
import 'package:bvg_departures_app/features/stops/data/models/stop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A widget that displays a list item for a stop in the search results.
/// This widget is used to present information about a stop, including its name,
/// location, and available transportation products.
/// It includes an icon representing the stop and a list of product icons
/// that indicate the types of transportation available at the stop.
/// The widget is designed to be used in a list view, allowing users to
/// easily browse through search results for stops.
class StopSearchListItem extends StatelessWidget {
  final Stop stop;

  const StopSearchListItem({
    super.key,
    required this.stop,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final widthHeightSize = 28.0;
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/svg/explore_nearby.svg',
            width: widthHeightSize,
            height: widthHeightSize,
          ),
        ],
      ),
      title: Text(stop.name ?? 'No name', style: theme.textTheme.titleSmall),
      subtitle: _getProductIcons(stop.products ?? Products()),
      trailing: SvgPicture.asset('assets/svg/chevron_right.svg',
          width: widthHeightSize, height: widthHeightSize),
    );
  }

  Widget _getProductIcons(Products product) {
    final widthHeightSize = 24.0;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        spacing: 4.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (product.suburban ?? false)
            SvgPicture.asset('assets/svg/suburban.svg',
                width: widthHeightSize, height: widthHeightSize),
          if (product.subway ?? false)
            SvgPicture.asset('assets/svg/subway.svg',
                width: widthHeightSize, height: widthHeightSize),
          if (product.tram ?? false)
            SvgPicture.asset('assets/svg/tram.svg',
                width: widthHeightSize, height: widthHeightSize),
          if (product.bus ?? false)
            SvgPicture.asset('assets/svg/bus.svg',
                width: widthHeightSize, height: widthHeightSize),
          if (product.ferry ?? false)
            SvgPicture.asset('assets/svg/ferry.svg',
                width: widthHeightSize, height: widthHeightSize),
          if (product.express ?? false)
            SvgPicture.asset('assets/svg/express.svg',
                width: widthHeightSize, height: widthHeightSize),
          if (product.regional ?? false)
            SvgPicture.asset('assets/svg/regional.svg',
                width: widthHeightSize, height: widthHeightSize),
        ],
      ),
    );
  }
}
