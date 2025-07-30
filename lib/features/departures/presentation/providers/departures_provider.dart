import 'package:bvg_departures_app/features/departures/data/models/departure.dart';
import 'package:bvg_departures_app/features/departures/data/repositories/departure_repository.dart';
import 'package:bvg_departures_app/features/departures/domain/use_cases/get_departures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final departureRepositoryProvider = Provider((ref) => DepartureRepository());

final getDeparturesProvider =
    Provider((ref) => GetDepartures(ref.read(departureRepositoryProvider)));

final departuresProvider =
    FutureProvider.family<List<Departure>, String>((ref, stopId) async {
  final getDepartures = ref.read(getDeparturesProvider);
  final departures = await getDepartures(GetDeparturesParams(stopId));
  return departures.whereType<Departure>().toList();
});
