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
    this.suburban = false,
    this.subway = false,
    this.tram = false,
    this.bus = false,
    this.ferry = false,
    this.express = false,
    this.regional = false,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
