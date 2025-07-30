import 'package:bvg_departures_app/core/constants/app_colors.dart';
import 'package:bvg_departures_app/core/widgets/app_bar_delimiter.dart';
import 'package:bvg_departures_app/features/stops/data/models/stop.dart';
import 'package:bvg_departures_app/features/stops/presentation/providers/stops_provider.dart';
import 'package:bvg_departures_app/features/stops/presentation/widgets/no_item_found.dart';
import 'package:bvg_departures_app/features/stops/presentation/widgets/stop_serach_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerWidget {
  SearchScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: TypeAheadField<Stop>(
          controller: _searchController,
          suggestionsCallback: (pattern) async {
            if (pattern.isEmpty) return [];
            return await ref.read(stopsProvider(pattern).future);
          },
          builder: (context, controller, focusNode) {
            return TextField(
              controller: controller,
              focusNode: focusNode,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search for a BVG stop',
                border: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                prefixIcon: IconButton(
                  icon: SvgPicture.asset(
                    'assets/svg/arrow_left_alt.svg',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () => context.go('/'),
                ),
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _searchController,
                  builder: (context, value, _) {
                    return Visibility(
                      visible: value.text.isNotEmpty,
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/svg/cancel.svg',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          _searchController.clear(); // Clear search text
                          FocusScope.of(context)
                              .requestFocus(); // Keep keyboard open
                        },
                      ),
                    );
                  },
                ),
              ),
              style: Theme.of(context).textTheme.titleMedium,
            );
          },
          itemBuilder: (context, Stop stop) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: StopSearchListItem(stop: stop),
            );
          },
          onSelected: (Stop stop) {
            context.go('/departures/${stop.id}/${stop.name}');
          },
          hideOnEmpty: false,
          emptyBuilder: (context) => const NoItemsFound(),
          loadingBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
        ),
        bottom: appBarDelimiter(),
      ),
      body: Container(), // Empty body since search is in app bar
    );
  }
}
