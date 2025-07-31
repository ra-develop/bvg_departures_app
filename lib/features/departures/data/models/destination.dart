import 'package:bvg_departures_app/core/data/models/location.dart';
import 'package:bvg_departures_app/core/data/models/products.dart';
import 'package:json_annotation/json_annotation.dart';

part 'destination.g.dart';

/// Represents a destination, which can be a stop or station.
/// This model includes the type of destination, its ID, name, location,
/// and the available transportation products.
/// The `type` field is set to "stop" by default, indicating that this model
/// is primarily used for stops.
/// The `id` field is a unique identifier for the destination.
/// The `name` field is the name of the stop or station.
/// The `location` field contains geographical coordinates (latitude and longitude)
@JsonSerializable()
class Destination {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "location")
  Location? location;
  @JsonKey(name: "products")
  Products? products;

  Destination({
    this.type = "stop",
    this.id = "",
    this.name,
    this.location,
    this.products,
  });

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}
