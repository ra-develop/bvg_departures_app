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

/// A screen that allows users to search for stops.
/// This screen is part of the stops feature in the BVG Departures App.
/// It uses the Riverpod state management library to fetch and display stops.
/// The screen includes an AppBar with a search field and a close button.
/// The search field uses TypeAheadField to provide suggestions as the user types.
/// The suggestions are fetched using the stopsProvider, which retrieves
/// a list of Stop objects based on the provided search query.
/// The screen handles loading and error states using the FutureProvider's
/// `when` method, displaying a loading indicator while fetching data and
/// an error message if the fetch fails.
/// The user can select a stop from the suggestions, which navigates to the
/// DeparturesScreen for that stop, displaying its departures.
/// The screen also includes a clear button to reset the search field while keeping the keyboard open.
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
                hintText: 'Search for a station',
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
