import 'package:bvg_departures_app/features/departures/data/models/departure.dart';
import 'package:bvg_departures_app/features/departures/data/repositories/departure_repository.dart';
import 'package:equatable/equatable.dart';

/// Use case for retrieving departures from a specific stop.
/// This use case interacts with the DepartureRepository to fetch a list of departures
/// based on the provided stop ID.
class GetDepartures {
  final DepartureRepository _repository;

  GetDepartures(this._repository);

  Future<List<Departure?>> call(GetDeparturesParams params) async {
    return await _repository.getDepartures(params.stopId);
  }
}

/// Parameters for the GetDepartures use case.
/// This class encapsulates the parameters required to fetch departures,
/// specifically the stop ID for which departures are requested.
/// It extends Equatable to allow for easy comparison and testing.
class GetDeparturesParams extends Equatable {
  final String stopId;

  const GetDeparturesParams(this.stopId);

  @override
  List<Object> get props => [stopId];
}
