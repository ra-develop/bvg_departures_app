import 'package:json_annotation/json_annotation.dart';

part 'operator.g.dart';

@JsonSerializable()
class Operator {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;

  Operator({
    this.type,
    this.id,
    this.name,
  });

  factory Operator.fromJson(Map<String, dynamic> json) =>
      _$OperatorFromJson(json);

  Map<String, dynamic> toJson() => _$OperatorToJson(this);
}
