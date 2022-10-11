// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixelFordImage _$PixelFormImageFromJson(Map<String, dynamic> json) =>
    PixelFordImage(
      id: json['id'] as String,
      filename: json['filename'] as String,
      title: json['title'] as String?,
      urlFullSize: json['url_full_size'] as String,
      urlSmallSize: json['url_small_size'] as String,
    );

Map<String, dynamic> _$PixelFormImageToJson(PixelFordImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'title': instance.title,
      'url_full_size': instance.urlFullSize,
      'url_small_size': instance.urlSmallSize,
    };
