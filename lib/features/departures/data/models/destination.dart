import 'package:bvg_departures_app/core/data/models/location.dart';
import 'package:bvg_departures_app/core/data/models/products.dart';
import 'package:json_annotation/json_annotation.dart';

part 'destination.g.dart';

/// Represents a destination, which can be a stop or station.
/// This model includes the type of destination, its ID, name, location,
/// and the available transportation products.
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
