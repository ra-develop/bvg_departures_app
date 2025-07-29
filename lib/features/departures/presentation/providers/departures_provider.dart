import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/stop.dart';
import '../../data/models/departure.dart';
import '../../domain/use_cases/search_stops.dart';
import '../../domain/use_cases/get_departures.dart';
import '../../data/repositories/departure_repository.dart';

final departureRepositoryProvider = Provider((ref) => DepartureRepository());
final searchStopsProvider =
    Provider((ref) => SearchStops(ref.read(departureRepositoryProvider)));
final getDeparturesProvider =
    Provider((ref) => GetDepartures(ref.read(departureRepositoryProvider)));

final stopsProvider =
    FutureProvider.family<List<Stop>, String>((ref, query) async {
  final searchStops = ref.read(searchStopsProvider);
  final stops = await searchStops(SearchStopsParams(query));
  return stops.whereType<Stop>().toList();
});

final departuresProvider =
    FutureProvider.family<List<Departure>, String>((ref, stopId) async {
  final getDepartures = ref.read(getDeparturesProvider);
  final departures = await getDepartures(GetDeparturesParams(stopId));
  return departures.whereType<Departure>().toList();
});
