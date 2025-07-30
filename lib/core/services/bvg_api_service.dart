import 'package:bvg_departures_app/core/network/dio_client.dart';
import 'package:bvg_departures_app/features/departures/data/models/departure.dart';
import 'package:bvg_departures_app/features/stops/data/models/stop.dart';
import 'package:dio/dio.dart';

class BvgApiService {
  final Dio _dio = DioClient.instance;

  Future<List<Stop>> searchStops(String query) async {
    try {
      final response =
          await _dio.get('/stops', queryParameters: {'query': query});

      final stops = <Stop>[];
      for (var json in response.data as List) {
        var stop = Stop.fromJson(json);
        var idIBNR = stop.id.split(":")[2];
        stops.add(await getStopById(idIBNR));
      }
      return stops;
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

  Future<Stop> getStopById(String stopId) async {
    try {
      final response = await _dio
          .get('/stops/$stopId', queryParameters: {'linesOfStops': false});
      return Stop.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch stop: $e');
    }
  }
}
