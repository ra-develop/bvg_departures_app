import 'package:bvg_departures_app/features/home/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/departures/presentation/screens/departures_screen.dart';
import 'features/stops/presentation/screens/search_screen.dart';

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
        path: '/departures/:stopId',
        builder: (context, state) {
          final stopId = state.pathParameters['stopId']!;
          return DeparturesScreen(stopId: stopId);
        },
      ),
    ],
  );
});
