import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_item.freezed.dart';
part 'media_item.g.dart';

/// Supported media source formats for native processing.
enum MediaSourceType { hls, dash, progressive, file }

/// DRM License Configuration for encrypted content.
@freezed
abstract class DrmConfiguration with _$DrmConfiguration {
  const factory DrmConfiguration({
    required String licenseUrl,
    Map<String, String>? headers,
  }) = _DrmConfiguration;

  const DrmConfiguration._();

  factory DrmConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DrmConfigurationFromJson(json);
}

/// Core media asset representation passed across platform channels.
@freezed
abstract class MediaItem with _$MediaItem {
  const factory MediaItem({
    required String id,
    required String url,
    @Default(MediaSourceType.dash) MediaSourceType type,
    DrmConfiguration? drmConfiguration,
    Map<String, String>? headers,
  }) = _MediaItem;

  const MediaItem._();

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
      _$MediaItemFromJson(json);
}
