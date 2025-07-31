import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

/// Represents the different types of transportation products available.
/// This model is used to indicate which transportation products are available
/// for a specific stop or station.   /// The fields are boolean values indicating the availability of each product.
/// The `suburban`, `subway`, `tram`, `bus`, `ferry`, `express`, and `regional`
/// fields represent the respective transportation products.
/// All fields are optional and default to `false` if not provided.
/// This model is serializable to and from JSON format, making it suitable for
/// use in APIs or local storage.
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
