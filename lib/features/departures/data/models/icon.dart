import 'package:json_annotation/json_annotation.dart';

part 'icon.g.dart';

@JsonSerializable()
class Icon {
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "title")
  final String? title;

  Icon({
    this.type,
    this.title,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => _$IconFromJson(json);

  Map<String, dynamic> toJson() => _$IconToJson(this);
}
