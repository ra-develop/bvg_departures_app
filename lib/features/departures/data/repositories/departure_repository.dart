import 'package:bvg_departures_app/core/services/bvg_api_service.dart';
import 'package:bvg_departures_app/features/departures/data/models/departure.dart';

/// A repository class for managing departures.
/// This class interacts with the BvgApiService to fetch departure data.
/// It provides methods to retrieve departures for a specific stop.
/// The repository pattern is used to abstract the data layer from the rest of the application,
/// allowing for easier testing and maintenance.
class DepartureRepository {
  final BvgApiService _apiService = BvgApiService();

  /// The `getDepartures` method fetches a list of departures for a given stop ID.
  /// It returns a list of Departure objects, which can be null if no departures are found.
  /// This repository can be extended in the future to include caching or other data sources.
  /// This class is part of the departures feature in the BVG Departures App.
  /// It is designed to work with the BvgApiService, which handles the actual API calls.
  /// The DepartureRepository is responsible for providing departure data to the UI layer.
  Future<List<Departure?>> getDepartures(String stopId) async {
    return await _apiService.getDepartures(stopId);
  }
}
