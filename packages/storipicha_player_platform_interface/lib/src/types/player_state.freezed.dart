// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerStateSnapshot {

 PlaybackState get state; bool get isPlaying; Duration get position; Duration get bufferedPosition; Duration get duration; String? get errorMessage;
/// Create a copy of PlayerStateSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerStateSnapshotCopyWith<PlayerStateSnapshot> get copyWith => _$PlayerStateSnapshotCopyWithImpl<PlayerStateSnapshot>(this as PlayerStateSnapshot, _$identity);

  /// Serializes this PlayerStateSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerStateSnapshot&&(identical(other.state, state) || other.state == state)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.position, position) || other.position == position)&&(identical(other.bufferedPosition, bufferedPosition) || other.bufferedPosition == bufferedPosition)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,isPlaying,position,bufferedPosition,duration,errorMessage);

@override
String toString() {
  return 'PlayerStateSnapshot(state: $state, isPlaying: $isPlaying, position: $position, bufferedPosition: $bufferedPosition, duration: $duration, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PlayerStateSnapshotCopyWith<$Res>  {
  factory $PlayerStateSnapshotCopyWith(PlayerStateSnapshot value, $Res Function(PlayerStateSnapshot) _then) = _$PlayerStateSnapshotCopyWithImpl;
@useResult
$Res call({
 PlaybackState state, bool isPlaying, Duration position, Duration bufferedPosition, Duration duration, String? errorMessage
});




}
/// @nodoc
class _$PlayerStateSnapshotCopyWithImpl<$Res>
    implements $PlayerStateSnapshotCopyWith<$Res> {
  _$PlayerStateSnapshotCopyWithImpl(this._self, this._then);

  final PlayerStateSnapshot _self;
  final $Res Function(PlayerStateSnapshot) _then;

/// Create a copy of PlayerStateSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? isPlaying = null,Object? position = null,Object? bufferedPosition = null,Object? duration = null,Object? errorMessage = freezed,}) {
  return _then(PlayerStateSnapshot(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as PlaybackState,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,bufferedPosition: null == bufferedPosition ? _self.bufferedPosition : bufferedPosition // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerStateSnapshot].
extension PlayerStateSnapshotPatterns on PlayerStateSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerStateSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerStateSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerStateSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _PlayerStateSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerStateSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerStateSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlaybackState state,  bool isPlaying,  Duration position,  Duration bufferedPosition,  Duration duration,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerStateSnapshot() when $default != null:
return $default(_that.state,_that.isPlaying,_that.position,_that.bufferedPosition,_that.duration,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlaybackState state,  bool isPlaying,  Duration position,  Duration bufferedPosition,  Duration duration,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PlayerStateSnapshot():
return $default(_that.state,_that.isPlaying,_that.position,_that.bufferedPosition,_that.duration,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlaybackState state,  bool isPlaying,  Duration position,  Duration bufferedPosition,  Duration duration,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PlayerStateSnapshot() when $default != null:
return $default(_that.state,_that.isPlaying,_that.position,_that.bufferedPosition,_that.duration,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerStateSnapshot implements PlayerStateSnapshot {
  const _PlayerStateSnapshot({required this.state, required this.isPlaying, required this.position, required this.bufferedPosition, required this.duration, this.errorMessage});
  factory _PlayerStateSnapshot.fromJson(Map<String, dynamic> json) => _$PlayerStateSnapshotFromJson(json);

@override final  PlaybackState state;
@override final  bool isPlaying;
@override final  Duration position;
@override final  Duration bufferedPosition;
@override final  Duration duration;
@override final  String? errorMessage;

/// Create a copy of PlayerStateSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerStateSnapshotCopyWith<_PlayerStateSnapshot> get copyWith => __$PlayerStateSnapshotCopyWithImpl<_PlayerStateSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerStateSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerStateSnapshot&&(identical(other.state, state) || other.state == state)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.position, position) || other.position == position)&&(identical(other.bufferedPosition, bufferedPosition) || other.bufferedPosition == bufferedPosition)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,isPlaying,position,bufferedPosition,duration,errorMessage);

@override
String toString() {
  return 'PlayerStateSnapshot(state: $state, isPlaying: $isPlaying, position: $position, bufferedPosition: $bufferedPosition, duration: $duration, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PlayerStateSnapshotCopyWith<$Res> implements $PlayerStateSnapshotCopyWith<$Res> {
  factory _$PlayerStateSnapshotCopyWith(_PlayerStateSnapshot value, $Res Function(_PlayerStateSnapshot) _then) = __$PlayerStateSnapshotCopyWithImpl;
@override @useResult
$Res call({
 PlaybackState state, bool isPlaying, Duration position, Duration bufferedPosition, Duration duration, String? errorMessage
});




}
/// @nodoc
class __$PlayerStateSnapshotCopyWithImpl<$Res>
    implements _$PlayerStateSnapshotCopyWith<$Res> {
  __$PlayerStateSnapshotCopyWithImpl(this._self, this._then);

  final _PlayerStateSnapshot _self;
  final $Res Function(_PlayerStateSnapshot) _then;

/// Create a copy of PlayerStateSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? isPlaying = null,Object? position = null,Object? bufferedPosition = null,Object? duration = null,Object? errorMessage = freezed,}) {
  return _then(_PlayerStateSnapshot(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as PlaybackState,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,bufferedPosition: null == bufferedPosition ? _self.bufferedPosition : bufferedPosition // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
