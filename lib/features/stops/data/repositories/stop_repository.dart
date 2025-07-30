import 'package:bvg_departures_app/core/services/bvg_api_service.dart';
import 'package:bvg_departures_app/features/stops/data/models/stop.dart';

class StopRepository {
  final BvgApiService _apiService = BvgApiService();

  Future<List<Stop?>> searchStops(String query) async {
    return await _apiService.searchStops(query);
  }
}
