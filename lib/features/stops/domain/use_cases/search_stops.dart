import 'package:bvg_departures_app/features/stops/data/models/stop.dart';
import 'package:bvg_departures_app/features/stops/data/repositories/stop_repository.dart';
import 'package:equatable/equatable.dart';

/// Use case for searching stops based on a query.
/// This use case interacts with the StopRepository to fetch a list of stops
/// that match the provided search query.
class SearchStops {
  final StopRepository _repository;

  SearchStops(this._repository);

  Future<List<Stop?>> call(SearchStopsParams params) async {
    return await _repository.searchStops(params.query);
  }
}

/// Parameters for the SearchStops use case.
/// This class encapsulates the parameters required to search for stops,
/// specifically the search query.
/// It extends Equatable to allow for easy comparison and testing.
class SearchStopsParams extends Equatable {
  final String query;

  const SearchStopsParams(this.query);

  @override
  List<Object> get props => [query];
}
