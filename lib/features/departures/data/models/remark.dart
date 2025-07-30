import 'package:bvg_departures_app/features/departures/data/models/icon.dart';
import 'package:bvg_departures_app/core/data/models/products.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remark.g.dart';

@JsonSerializable()
class Remark {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "text")
  String? text;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "summary")
  String? summary;
  @JsonKey(name: "icon")
  Icon? icon;
  @JsonKey(name: "priority")
  int? priority;
  @JsonKey(name: "products")
  Products? products;
  @JsonKey(name: "company")
  String? company;
  @JsonKey(name: "categories")
  List<int>? categories;
  @JsonKey(name: "validFrom")
  DateTime? validFrom;
  @JsonKey(name: "validUntil")
  DateTime? validUntil;
  @JsonKey(name: "modified")
  DateTime? modified;

  Remark({
    this.type,
    this.code,
    this.text,
    this.id,
    this.summary,
    this.icon,
    this.priority,
    this.products,
    this.company,
    this.categories,
    this.validFrom,
    this.validUntil,
    this.modified,
  });

  String get formattedValidFrom =>
      validFrom != null ? DateFormat('HH:mm').format(validFrom!) : "N/A";

  String get formattedValidUntil =>
      validUntil != null ? DateFormat('HH:mm').format(validUntil!) : "N/A";

  String get formattedModified =>
      modified != null ? DateFormat('HH:mm').format(modified!) : "N/A";

  factory Remark.fromJson(Map<String, dynamic> json) => _$RemarkFromJson(json);

  Map<String, dynamic> toJson() => _$RemarkToJson(this);
}
