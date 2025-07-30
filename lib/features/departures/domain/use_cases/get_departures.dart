import 'package:bvg_departures_app/features/departures/data/models/departure.dart';
import 'package:bvg_departures_app/features/departures/data/repositories/departure_repository.dart';
import 'package:equatable/equatable.dart';

class GetDepartures {
  final DepartureRepository _repository;

  GetDepartures(this._repository);

  Future<List<Departure?>> call(GetDeparturesParams params) async {
    return await _repository.getDepartures(params.stopId);
  }
}

class GetDeparturesParams extends Equatable {
  final String stopId;

  const GetDeparturesParams(this.stopId);

  @override
  List<Object> get props => [stopId];
}
