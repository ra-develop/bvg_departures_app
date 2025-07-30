import 'package:bvg_departures_app/features/stops/data/models/stop.dart';
import 'package:bvg_departures_app/features/stops/data/repositories/stop_repository.dart';
import 'package:equatable/equatable.dart';

class SearchStops {
  final StopRepository _repository;

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
