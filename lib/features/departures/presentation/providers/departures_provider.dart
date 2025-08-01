import 'package:bvg_departures_app/features/departures/data/models/departure.dart';
import 'package:bvg_departures_app/features/departures/data/repositories/departure_repository.dart';
import 'package:bvg_departures_app/features/departures/domain/use_cases/get_departures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for the DepartureRepository.
/// This provider is used to access the repository methods for fetching departures.
/// It allows the application to retrieve departure data from the BVG API.
/// The repository abstracts the data layer, making it easier to manage dependencies
/// and test the application.
final departureRepositoryProvider = Provider((ref) => DepartureRepository());

/// Provider for the GetDepartures use case.
/// This provider is responsible for executing the use case to fetch departures
/// based on a given stop ID. It uses the DepartureRepository to perform the actual
/// data retrieval.
/// The use case encapsulates the business logic for fetching departures,
/// allowing the UI layer to remain clean and focused on presentation.
final getDeparturesProvider =
    Provider((ref) => GetDepartures(ref.read(departureRepositoryProvider)));

/// Provider for fetching departures based on a stop ID.
/// This provider uses the GetDepartures use case to retrieve a list of departures
/// for a specific stop. It takes the stop ID as a parameter and returns a FutureProvider
/// that resolves to a list of Departure objects.
/// The departures are filtered to exclude any null values, ensuring that only valid
/// departures are returned.
/// This provider can be used in the UI to display departures for a selected stop.
final departuresProvider =
    FutureProvider.family<List<Departure>, String>((ref, stopId) async {
  final getDepartures = ref.read(getDeparturesProvider);
  final departures = await getDepartures(GetDeparturesParams(stopId));
  return departures.whereType<Departure>().toList();
});
