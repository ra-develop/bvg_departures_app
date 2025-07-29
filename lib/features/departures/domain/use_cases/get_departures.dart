import 'package:equatable/equatable.dart';
import '../../data/models/departure.dart';
import '../../data/repositories/departure_repository.dart';

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
