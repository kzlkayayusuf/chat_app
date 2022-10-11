
import 'package:json_annotation/json_annotation.dart';
part 'image_model.g.dart';

@JsonSerializable()
class PixelFordImage {
  String id;
  String filename;
  String? title;
  @JsonKey(name: 'url_full_size')
  String urlFullSize;
  @JsonKey(name: 'url_small_size')
  String urlSmallSize;

  PixelFordImage(
      {required this.id,
      required this.filename,
      this.title,
      required this.urlFullSize,
      required this.urlSmallSize});

  factory PixelFordImage.fromJson(Map<String, dynamic> json) =>
      _$PixelFormImageFromJson(json);

  Map<String, dynamic> toJson() => _$PixelFormImageToJson(this);
}
