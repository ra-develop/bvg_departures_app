import 'package:json_annotation/json_annotation.dart';

part 'operator.g.dart';

/// Represents an operator in the BVG system.
/// This model includes the type of operator, its ID, and name.
/// The `type` field indicates the nature of the operator, such as a transport company.
/// The `id` field is a unique identifier for the operator.
/// The `name` field is the name of the operator.
/// This model is serializable to and from JSON format, making it suitable for
/// use in APIs or local storage.
/// Example usage:
/// ```dart
/// final operator = Operator(type: 'transport', id: '123', name: 'B  VG');
/// final json = operator.toJson();
/// final newOperator = Operator.fromJson(json);
/// ```
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
