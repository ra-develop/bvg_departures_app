import '../models/stop.dart';
import '../models/departure.dart';
import '../services/bvg_api_service.dart';

class DepartureRepository {
  final BvgApiService _apiService = BvgApiService();

  Future<List<Stop?>> searchStops(String query) async {
    return await _apiService.searchStops(query);
  }

  Future<List<Departure?>> getDepartures(String stopId) async {
    return await _apiService.getDepartures(stopId);
  }
}
