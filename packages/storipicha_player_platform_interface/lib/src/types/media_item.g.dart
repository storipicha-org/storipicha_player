// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DrmConfiguration _$DrmConfigurationFromJson(Map<String, dynamic> json) =>
    _DrmConfiguration(
      licenseUrl: json['licenseUrl'] as String,
      headers: (json['headers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$DrmConfigurationToJson(_DrmConfiguration instance) =>
    <String, dynamic>{
      'licenseUrl': instance.licenseUrl,
      'headers': ?instance.headers,
    };

_MediaItem _$MediaItemFromJson(Map<String, dynamic> json) => _MediaItem(
  id: json['id'] as String,
  url: json['url'] as String,
  type:
      $enumDecodeNullable(_$MediaSourceTypeEnumMap, json['type']) ??
      MediaSourceType.dash,
  drmConfiguration: json['drmConfiguration'] == null
      ? null
      : DrmConfiguration.fromJson(
          json['drmConfiguration'] as Map<String, dynamic>,
        ),
  headers: (json['headers'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
);

Map<String, dynamic> _$MediaItemToJson(_MediaItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'type': _$MediaSourceTypeEnumMap[instance.type]!,
      'drmConfiguration': ?instance.drmConfiguration?.toJson(),
      'headers': ?instance.headers,
    };

const _$MediaSourceTypeEnumMap = {
  MediaSourceType.hls: 'hls',
  MediaSourceType.dash: 'dash',
  MediaSourceType.progressive: 'progressive',
  MediaSourceType.file: 'file',
};
