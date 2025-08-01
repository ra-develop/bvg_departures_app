import 'package:bvg_departures_app/features/stops/data/models/stop.dart';
import 'package:bvg_departures_app/features/stops/data/repositories/stop_repository.dart';
import 'package:bvg_departures_app/features/stops/domain/use_cases/search_stops.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for the StopRepository.
/// This provider is used to access the repository methods for fetching stops.
/// It allows the application to retrieve stop data from the BVG API.
/// The repository abstracts the data layer, making it easier to manage dependencies
/// and test the application.
final stopRepositoryProvider = Provider((ref) => StopRepository());

/// Provider for the SearchStops use case.
/// This provider is responsible for executing the use case to search for stops
/// based on a given query. It uses the StopRepository to perform the actual
/// data retrieval.
/// The use case encapsulates the business logic for searching stops,
/// allowing the UI layer to remain clean and focused on presentation.
final searchStopsProvider =
    Provider((ref) => SearchStops(ref.read(stopRepositoryProvider)));

/// Provider for searching stops based on a query.
/// This provider uses the SearchStops use case to retrieve a list of stops
/// that match the provided search query. It takes the query as a parameter and returns
/// a FutureProvider that resolves to a list of Stop objects.
/// The stops are filtered to exclude any null values, ensuring that only valid
/// stops are returned.
/// This provider can be used in the UI to display search results for stops.
final stopsProvider =
    FutureProvider.family<List<Stop>, String>((ref, query) async {
  final searchStops = ref.read(searchStopsProvider);
  final stops = await searchStops(SearchStopsParams(query));
  return stops.whereType<Stop>().toList();
});
