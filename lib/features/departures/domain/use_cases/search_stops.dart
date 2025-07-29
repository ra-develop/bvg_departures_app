import 'package:equatable/equatable.dart';
import '../../data/models/stop.dart';
import '../../data/repositories/departure_repository.dart';

class SearchStops {
  final DepartureRepository _repository;

  SearchStops(this._repository);

  Future<List<Stop?>> call(SearchStopsParams params) async {
    return await _repository.searchStops(params.query);
  }
}

class SearchStopsParams extends Equatable {
  final String query;

  const SearchStopsParams(this.query);

  @override
  List<Object> get props => [query];
}
