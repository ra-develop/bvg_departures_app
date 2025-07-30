import 'package:bvg_departures_app/core/services/bvg_api_service.dart';
import 'package:bvg_departures_app/features/departures/data/models/departure.dart';

class DepartureRepository {
  final BvgApiService _apiService = BvgApiService();

  Future<List<Departure?>> getDepartures(String stopId) async {
    return await _apiService.getDepartures(stopId);
  }
}
