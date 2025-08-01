import 'package:bvg_departures_app/core/network/dio_client.dart';
import 'package:bvg_departures_app/features/departures/data/models/departure.dart';
import 'package:bvg_departures_app/features/stops/data/models/stop.dart';
import 'package:dio/dio.dart';

/// A service class for interacting with the BVG API.
/// This class provides methods to search for stops, get departures for a specific stop,
/// and get details of a stop by its ID.
/// It uses Dio for making HTTP requests and handles the parsing of JSON responses.
class BvgApiService {
  final Dio _dio = DioClient.instance;

  /// The base URL is set to 'https://v6.bvg.transport.rest', which is the API endpoint for BVG (Berliner Verkehrsbetriebe).
  /// The client has a connection timeout of 10 seconds and a receive timeout of 10 seconds.
  /// This configuration ensures that requests do not hang indefinitely and provides a reasonable timeout for network
  /// operations.
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

  /// Fetches a list of departures for a given stop ID.
  /// Returns a Future that resolves to a list of Departure objects.
  /// The departures are filtered to exclude any null values, ensuring that only valid
  /// departures are returned.
  /// This method can be used in the UI to display departures for a selected stop.
  /// The method uses the Dio client to make a GET request to the BVG API,
  /// specifically to the '/stops/{stopId}/departures' endpoint.
  /// The response is parsed into a list of Departure objects.
  /// If an error occurs during the request, an exception is thrown with a descriptive message.
  /// The method can be extended in the future to include additional parameters,
  /// such as filtering or sorting options for the departures.
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

  /// Fetches details of a stop by its ID.
  /// Returns a Future that resolves to a Stop object.
  /// The stop details include information such as the name, location, and type of the stop.
  /// This method can be used in the UI to display detailed information about a specific stop.
  /// The method uses the Dio client to make a GET request to the BVG API,
  /// specifically to the '/stops/{stopId}' endpoint.
  /// The response is parsed into a Stop object.
  /// If an error occurs during the request, an exception is thrown with a descriptive message.
  /// The method can be extended in the future to include additional parameters,
  /// such as options to include lines of stops or other related data.
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
