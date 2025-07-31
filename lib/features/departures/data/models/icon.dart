import 'package:json_annotation/json_annotation.dart';

part 'icon.g.dart';

/// Represents an icon with a type and title.
/// This model is used to define icons that can be associated with various
/// features or elements in the application.
/// The `type` field indicates the type of icon, which can be used for
/// categorization or styling purposes.
/// The `title` field provides a human-readable name for the icon.
/// This model is serializable to and from JSON format, making it suitable for
/// use in APIs or local storage.
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
