import 'package:bvg_departures_app/core/network/dio_client.dart';
import 'package:bvg_departures_app/features/departures/data/models/departure.dart';
import 'package:bvg_departures_app/features/departures/data/models/stop.dart';
import 'package:dio/dio.dart';

class BvgApiService {
  final Dio _dio = DioClient.instance;

  Future<List<Stop>> searchStops(String query) async {
    try {
      final response =
          await _dio.get('/stops', queryParameters: {'query': query});
      return (response.data as List)
          .map((json) => Stop.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to search stops: $e');
    }
  }

  Future<List<Departure>> getDepartures(String stopId) async {
    try {
      final response = await _dio
          .get('/stops/$stopId/departures', queryParameters: {'results': 30});
      return (response.data['departures'] as List)
          .map((json) => Departure.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch departures: $e');
    }
  }
}
