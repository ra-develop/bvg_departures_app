import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

/// Represents a geographical location with optional latitude and longitude.
/// This model is used to store location data, such as for stops or stations.
/// The `type` field is set to "location" to indicate the nature of this model.
/// The `id` field is a unique identifier for the location.
/// The `latitude` and `longitude` fields are optional and can be used to specify
/// the exact geographical coordinates of the location.
/// This model is serializable to and from JSON format, making it suitable for
/// use in APIs or local storage.
/// Example usage:
/// ```dart
/// final location = Location(id: '123', latitude: 52.5200, longitude: 13.4050);
/// final json = location.toJson();
/// final newLocation = Location.fromJson(json);
@JsonSerializable()
class Location {
  String? type; // "location"
  String id;
  double? latitude;
  double? longitude;

  Location({
    this.type,
    this.id = "",
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
