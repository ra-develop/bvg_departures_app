import 'package:bvg_departures_app/features/home/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/departures/presentation/screens/departures_screen.dart';
import '../../features/stops/presentation/screens/search_screen.dart';

/// A provider for the GoRouter configuration.
/// This provider sets up the routing for the application,
/// defining the initial location and the routes available.
/// It includes routes for the home screen, search screen, and departures screen.
/// The GoRouter is used to navigate between different screens in the app.
/// The routes are defined using GoRoute, which allows for easy navigation
/// and parameter passing.
/// The initial location is set to the home screen.
/// The departures screen route includes parameters for the stop ID and stop name,
/// allowing the app to display departures for a specific stop.
/// The GoRouter is provided to the app using the Provider package,
/// enabling dependency injection and making it accessible throughout the app.
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => SearchScreen(),
      ),
      GoRoute(
        path: '/departures/:stopId/:stopName',
        builder: (context, state) {
          final stopId = state.pathParameters['stopId']!;
          final stopName = state.pathParameters['stopName'] ?? '';
          return DeparturesScreen(
            stopId: stopId,
            stopName: stopName,
          );
        },
      ),
    ],
  );
});
