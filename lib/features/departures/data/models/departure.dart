import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'departure.g.dart';

@JsonSerializable()
class Departure {
  final String tripId;
  final String lineName;
  final String transportType; // e.g., 'bus', 'tram', 'ubahn', 'sbahn'
  final String direction;
  final DateTime plannedDeparture;
  final int? delayMinutes;
  final String? platform;

  Departure({
    required this.tripId,
    required this.lineName,
    required this.transportType,
    required this.direction,
    required this.plannedDeparture,
    this.delayMinutes,
    this.platform,
  });

  String get formattedTime => DateFormat('HH:mm').format(plannedDeparture);

  factory Departure.fromJson(Map<String, dynamic> json) =>
      _$DepartureFromJson(json);
  Map<String, dynamic> toJson() => _$DepartureToJson(this);
}
