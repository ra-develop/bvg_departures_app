import 'package:bvg_departures_app/features/stops/data/models/stop.dart';
import 'package:bvg_departures_app/features/stops/data/repositories/stop_repository.dart';
import 'package:bvg_departures_app/features/stops/domain/use_cases/search_stops.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stopRepositoryProvider = Provider((ref) => StopRepository());

final searchStopsProvider =
    Provider((ref) => SearchStops(ref.read(stopRepositoryProvider)));

final stopsProvider =
    FutureProvider.family<List<Stop>, String>((ref, query) async {
  final searchStops = ref.read(searchStopsProvider);
  final stops = await searchStops(SearchStopsParams(query));
  return stops.whereType<Stop>().toList();
});
