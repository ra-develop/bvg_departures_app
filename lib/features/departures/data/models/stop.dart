import 'package:json_annotation/json_annotation.dart';

part 'stop.g.dart';

@JsonSerializable()
class Stop {
  final String id;
  final String name;
  final double latitude;
  final double longitude;

  Stop(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude});

  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);
  Map<String, dynamic> toJson() => _$StopToJson(this);
}
