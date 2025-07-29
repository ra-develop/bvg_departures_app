import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  @JsonKey(name: "suburban")
  bool? suburban;
  @JsonKey(name: "subway")
  bool? subway;
  @JsonKey(name: "tram")
  bool? tram;
  @JsonKey(name: "bus")
  bool? bus;
  @JsonKey(name: "ferry")
  bool? ferry;
  @JsonKey(name: "express")
  bool? express;
  @JsonKey(name: "regional")
  bool? regional;

  Products({
    this.suburban,
    this.subway,
    this.tram,
    this.bus,
    this.ferry,
    this.express,
    this.regional,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
