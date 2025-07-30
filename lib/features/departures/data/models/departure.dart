import 'package:bvg_departures_app/features/departures/data/models/destination.dart';
import 'package:bvg_departures_app/features/departures/data/models/line.dart';
import 'package:bvg_departures_app/core/data/models/location.dart';
import 'package:bvg_departures_app/features/departures/data/models/remark.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'departure.g.dart';

@JsonSerializable()
class Departure {
  @JsonKey(name: "tripId")
  String? tripId;
  @JsonKey(name: "stop")
  Destination? stop;
  @JsonKey(name: "when")
  DateTime? when;
  @JsonKey(name: "plannedWhen")
  DateTime? plannedWhen;
  @JsonKey(name: "delay")
  int? delay;
  @JsonKey(name: "platform")
  String? platform;
  @JsonKey(name: "plannedPlatform")
  String? plannedPlatform;
  @JsonKey(name: "prognosisType")
  String? prognosisType;
  @JsonKey(name: "direction")
  String? direction;
  @JsonKey(name: "provenance")
  String? provenance;
  @JsonKey(name: "line")
  Line? line;
  @JsonKey(name: "remarks")
  List<Remark>? remarks;
  @JsonKey(name: "origin")
  String? origin;
  @JsonKey(name: "destination")
  Destination? destination;
  @JsonKey(name: "currentTripPosition")
  Location? currentTripPosition;

  Departure({
    required this.tripId,
    this.stop,
    this.when,
    this.plannedWhen,
    this.delay,
    this.platform,
    this.plannedPlatform,
    this.prognosisType,
    this.direction,
    this.provenance,
    this.line,
    this.remarks,
    this.origin,
    this.destination,
    this.currentTripPosition,
  });

  String get formattedWhen =>
      when != null ? DateFormat('HH:mm').format(when!) : "N/A";

  String get formattedPlannedWhen =>
      plannedWhen != null ? DateFormat('HH:mm').format(plannedWhen!) : "N/A";

  factory Departure.fromJson(Map<String, dynamic> json) =>
      _$DepartureFromJson(json);

  Map<String?, dynamic> toJson() => _$DepartureToJson(this);
}
