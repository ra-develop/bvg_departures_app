import 'package:bvg_departures_app/core/data/models/location.dart';
import 'package:bvg_departures_app/core/data/models/products.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stop.g.dart';

/// Represents a stop in the BVG system.
/// This model includes the type of stop, its ID, name, location,
/// weight, relevance, score, and a list of stops.
/// This model is serializable to and from JSON format, making it suitable for
/// use in APIs or local storage.
@JsonSerializable()
class Stop {
  String type;
  String id; // Unique identifier for the stop, can be an IBNR or similar
  String? name;
  Location? location;
  double? weight; // Weight of the stop, used for sorting or relevance
  double? relevance; // Relevance score of the stop, used for ranking
  double? score; // Overall score for the stop, used for ranking
  List<Stop>? stops;
  Products? products;

  Stop(
      {this.id = "",
      this.type = "stop",
      this.name,
      this.location,
      this.weight,
      this.relevance,
      this.score,
      this.stops,
      this.products});

  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);
  Map<String, dynamic> toJson() => _$StopToJson(this);
}
