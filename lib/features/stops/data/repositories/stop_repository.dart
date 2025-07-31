import 'package:bvg_departures_app/core/services/bvg_api_service.dart';
import 'package:bvg_departures_app/features/stops/data/models/stop.dart';

/// A repository class for managing stops.
/// This class interacts with the BvgApiService to fetch stop data.
/// It provides methods to search for stops based on a query.
/// The repository pattern is used to abstract the data layer from the rest of the application,
/// allowing for easier testing and maintenance.
class StopRepository {
  final BvgApiService _apiService = BvgApiService();

  /// Fetches a list of stops based on the provided search query.
  /// Returns a Future that resolves to a list of Stop objects.
  /// The stops are filtered to exclude any null values, ensuring that only valid
  /// stops are returned.
  /// This method can be used in the UI to display search results for stops.
  Future<List<Stop?>> searchStops(String query) async {
    return await _apiService.searchStops(query);
  }
}
