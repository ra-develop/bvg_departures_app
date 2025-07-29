import 'package:bvg_departures_app/features/departures/data/models/operator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'line.g.dart';

@JsonSerializable()
class Line {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "fahrtNr")
  String? fahrtNr;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "public")
  bool? public;
  @JsonKey(name: "adminCode")
  String? adminCode;
  @JsonKey(name: "productName")
  String? productName;
  @JsonKey(name: "mode")
  String? mode;
  @JsonKey(name: "product")
  String? product;
  @JsonKey(name: "operator")
  Operator? lineOperator;

  Line({
    this.type,
    this.id,
    this.fahrtNr,
    this.name,
    this.public,
    this.adminCode,
    this.productName,
    this.mode,
    this.product,
    this.lineOperator,
  });

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);

  Map<String, dynamic> toJson() => _$LineToJson(this);
}
