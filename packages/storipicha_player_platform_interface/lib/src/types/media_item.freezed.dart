// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DrmConfiguration {

 String get licenseUrl; Map<String, String>? get headers;
/// Create a copy of DrmConfiguration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DrmConfigurationCopyWith<DrmConfiguration> get copyWith => _$DrmConfigurationCopyWithImpl<DrmConfiguration>(this as DrmConfiguration, _$identity);

  /// Serializes this DrmConfiguration to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DrmConfiguration&&(identical(other.licenseUrl, licenseUrl) || other.licenseUrl == licenseUrl)&&const DeepCollectionEquality().equals(other.headers, headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,licenseUrl,const DeepCollectionEquality().hash(headers));

@override
String toString() {
  return 'DrmConfiguration(licenseUrl: $licenseUrl, headers: $headers)';
}


}

/// @nodoc
abstract mixin class $DrmConfigurationCopyWith<$Res>  {
  factory $DrmConfigurationCopyWith(DrmConfiguration value, $Res Function(DrmConfiguration) _then) = _$DrmConfigurationCopyWithImpl;
@useResult
$Res call({
 String licenseUrl, Map<String, String>? headers
});




}
/// @nodoc
class _$DrmConfigurationCopyWithImpl<$Res>
    implements $DrmConfigurationCopyWith<$Res> {
  _$DrmConfigurationCopyWithImpl(this._self, this._then);

  final DrmConfiguration _self;
  final $Res Function(DrmConfiguration) _then;

/// Create a copy of DrmConfiguration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? licenseUrl = null,Object? headers = freezed,}) {
  return _then(DrmConfiguration(
licenseUrl: null == licenseUrl ? _self.licenseUrl : licenseUrl // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DrmConfiguration].
extension DrmConfigurationPatterns on DrmConfiguration {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DrmConfiguration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DrmConfiguration() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DrmConfiguration value)  $default,){
final _that = this;
switch (_that) {
case _DrmConfiguration():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DrmConfiguration value)?  $default,){
final _that = this;
switch (_that) {
case _DrmConfiguration() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String licenseUrl,  Map<String, String>? headers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DrmConfiguration() when $default != null:
return $default(_that.licenseUrl,_that.headers);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String licenseUrl,  Map<String, String>? headers)  $default,) {final _that = this;
switch (_that) {
case _DrmConfiguration():
return $default(_that.licenseUrl,_that.headers);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String licenseUrl,  Map<String, String>? headers)?  $default,) {final _that = this;
switch (_that) {
case _DrmConfiguration() when $default != null:
return $default(_that.licenseUrl,_that.headers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DrmConfiguration extends DrmConfiguration {
  const _DrmConfiguration({required this.licenseUrl,  Map<String, String>? headers}): _headers = headers,super._();
  factory _DrmConfiguration.fromJson(Map<String, dynamic> json) => _$DrmConfigurationFromJson(json);

@override final  String licenseUrl;
 final  Map<String, String>? _headers;
@override Map<String, String>? get headers {
  final value = _headers;
  if (value == null) return null;
  if (_headers is EqualUnmodifiableMapView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of DrmConfiguration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DrmConfigurationCopyWith<_DrmConfiguration> get copyWith => __$DrmConfigurationCopyWithImpl<_DrmConfiguration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DrmConfigurationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DrmConfiguration&&(identical(other.licenseUrl, licenseUrl) || other.licenseUrl == licenseUrl)&&const DeepCollectionEquality().equals(other._headers, _headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,licenseUrl,const DeepCollectionEquality().hash(_headers));

@override
String toString() {
  return 'DrmConfiguration(licenseUrl: $licenseUrl, headers: $headers)';
}


}

/// @nodoc
abstract mixin class _$DrmConfigurationCopyWith<$Res> implements $DrmConfigurationCopyWith<$Res> {
  factory _$DrmConfigurationCopyWith(_DrmConfiguration value, $Res Function(_DrmConfiguration) _then) = __$DrmConfigurationCopyWithImpl;
@override @useResult
$Res call({
 String licenseUrl, Map<String, String>? headers
});




}
/// @nodoc
class __$DrmConfigurationCopyWithImpl<$Res>
    implements _$DrmConfigurationCopyWith<$Res> {
  __$DrmConfigurationCopyWithImpl(this._self, this._then);

  final _DrmConfiguration _self;
  final $Res Function(_DrmConfiguration) _then;

/// Create a copy of DrmConfiguration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? licenseUrl = null,Object? headers = freezed,}) {
  return _then(_DrmConfiguration(
licenseUrl: null == licenseUrl ? _self.licenseUrl : licenseUrl // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}


/// @nodoc
mixin _$MediaItem {

 String get id; String get url; MediaSourceType get type; DrmConfiguration? get drmConfiguration; Map<String, String>? get headers;
/// Create a copy of MediaItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaItemCopyWith<MediaItem> get copyWith => _$MediaItemCopyWithImpl<MediaItem>(this as MediaItem, _$identity);

  /// Serializes this MediaItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaItem&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.drmConfiguration, drmConfiguration) || other.drmConfiguration == drmConfiguration)&&const DeepCollectionEquality().equals(other.headers, headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,type,drmConfiguration,const DeepCollectionEquality().hash(headers));

@override
String toString() {
  return 'MediaItem(id: $id, url: $url, type: $type, drmConfiguration: $drmConfiguration, headers: $headers)';
}


}

/// @nodoc
abstract mixin class $MediaItemCopyWith<$Res>  {
  factory $MediaItemCopyWith(MediaItem value, $Res Function(MediaItem) _then) = _$MediaItemCopyWithImpl;
@useResult
$Res call({
 String id, String url, MediaSourceType type, DrmConfiguration? drmConfiguration, Map<String, String>? headers
});


$DrmConfigurationCopyWith<$Res>? get drmConfiguration;

}
/// @nodoc
class _$MediaItemCopyWithImpl<$Res>
    implements $MediaItemCopyWith<$Res> {
  _$MediaItemCopyWithImpl(this._self, this._then);

  final MediaItem _self;
  final $Res Function(MediaItem) _then;

/// Create a copy of MediaItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? type = null,Object? drmConfiguration = freezed,Object? headers = freezed,}) {
  return _then(MediaItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaSourceType,drmConfiguration: freezed == drmConfiguration ? _self.drmConfiguration : drmConfiguration // ignore: cast_nullable_to_non_nullable
as DrmConfiguration?,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}
/// Create a copy of MediaItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DrmConfigurationCopyWith<$Res>? get drmConfiguration {
    if (_self.drmConfiguration == null) {
    return null;
  }

  return $DrmConfigurationCopyWith<$Res>(_self.drmConfiguration!, (value) {
    return _then(_self.copyWith(drmConfiguration: value));
  });
}
}


/// Adds pattern-matching-related methods to [MediaItem].
extension MediaItemPatterns on MediaItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaItem value)  $default,){
final _that = this;
switch (_that) {
case _MediaItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaItem value)?  $default,){
final _that = this;
switch (_that) {
case _MediaItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String url,  MediaSourceType type,  DrmConfiguration? drmConfiguration,  Map<String, String>? headers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaItem() when $default != null:
return $default(_that.id,_that.url,_that.type,_that.drmConfiguration,_that.headers);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String url,  MediaSourceType type,  DrmConfiguration? drmConfiguration,  Map<String, String>? headers)  $default,) {final _that = this;
switch (_that) {
case _MediaItem():
return $default(_that.id,_that.url,_that.type,_that.drmConfiguration,_that.headers);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String url,  MediaSourceType type,  DrmConfiguration? drmConfiguration,  Map<String, String>? headers)?  $default,) {final _that = this;
switch (_that) {
case _MediaItem() when $default != null:
return $default(_that.id,_that.url,_that.type,_that.drmConfiguration,_that.headers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaItem extends MediaItem {
  const _MediaItem({required this.id, required this.url, this.type = MediaSourceType.dash, this.drmConfiguration,  Map<String, String>? headers}): _headers = headers,super._();
  factory _MediaItem.fromJson(Map<String, dynamic> json) => _$MediaItemFromJson(json);

@override final  String id;
@override final  String url;
@override@JsonKey() final  MediaSourceType type;
@override final  DrmConfiguration? drmConfiguration;
 final  Map<String, String>? _headers;
@override Map<String, String>? get headers {
  final value = _headers;
  if (value == null) return null;
  if (_headers is EqualUnmodifiableMapView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MediaItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaItemCopyWith<_MediaItem> get copyWith => __$MediaItemCopyWithImpl<_MediaItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaItem&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.drmConfiguration, drmConfiguration) || other.drmConfiguration == drmConfiguration)&&const DeepCollectionEquality().equals(other._headers, _headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,type,drmConfiguration,const DeepCollectionEquality().hash(_headers));

@override
String toString() {
  return 'MediaItem(id: $id, url: $url, type: $type, drmConfiguration: $drmConfiguration, headers: $headers)';
}


}

/// @nodoc
abstract mixin class _$MediaItemCopyWith<$Res> implements $MediaItemCopyWith<$Res> {
  factory _$MediaItemCopyWith(_MediaItem value, $Res Function(_MediaItem) _then) = __$MediaItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String url, MediaSourceType type, DrmConfiguration? drmConfiguration, Map<String, String>? headers
});


@override $DrmConfigurationCopyWith<$Res>? get drmConfiguration;

}
/// @nodoc
class __$MediaItemCopyWithImpl<$Res>
    implements _$MediaItemCopyWith<$Res> {
  __$MediaItemCopyWithImpl(this._self, this._then);

  final _MediaItem _self;
  final $Res Function(_MediaItem) _then;

/// Create a copy of MediaItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? type = null,Object? drmConfiguration = freezed,Object? headers = freezed,}) {
  return _then(_MediaItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaSourceType,drmConfiguration: freezed == drmConfiguration ? _self.drmConfiguration : drmConfiguration // ignore: cast_nullable_to_non_nullable
as DrmConfiguration?,headers: freezed == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

/// Create a copy of MediaItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DrmConfigurationCopyWith<$Res>? get drmConfiguration {
    if (_self.drmConfiguration == null) {
    return null;
  }

  return $DrmConfigurationCopyWith<$Res>(_self.drmConfiguration!, (value) {
    return _then(_self.copyWith(drmConfiguration: value));
  });
}
}

// dart format on
