import 'package:dio/dio.dart';

/// A singleton Dio client for making HTTP requests.
/// This client is configured with a base URL and default timeouts.
/// It can be used throughout the app to make network requests.
/// Example usage:
/// ```dart
/// final dio = DioClient.instance;
/// final response = await dio.get('/endpoint');
/// ```
/// The base URL is set to 'https://v6.bvg.transport.rest', which is the API endpoint for BVG (Berliner Verkehrsbetriebe).
/// The client has a connection timeout of 10 seconds and a receive timeout of 10 seconds.
/// This configuration ensures that requests do not hang indefinitely and provides a reasonable timeout for network operations.
class DioClient {
  static Dio get instance {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://v6.bvg.transport.rest',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    return dio;
  }
}
