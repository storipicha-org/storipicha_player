// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayerStateSnapshot _$PlayerStateSnapshotFromJson(Map<String, dynamic> json) =>
    _PlayerStateSnapshot(
      state: $enumDecode(_$PlaybackStateEnumMap, json['state']),
      isPlaying: json['isPlaying'] as bool,
      position: Duration(microseconds: (json['position'] as num).toInt()),
      bufferedPosition: Duration(
        microseconds: (json['bufferedPosition'] as num).toInt(),
      ),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$PlayerStateSnapshotToJson(
  _PlayerStateSnapshot instance,
) => <String, dynamic>{
  'state': _$PlaybackStateEnumMap[instance.state]!,
  'isPlaying': instance.isPlaying,
  'position': instance.position.inMicroseconds,
  'bufferedPosition': instance.bufferedPosition.inMicroseconds,
  'duration': instance.duration.inMicroseconds,
  'errorMessage': ?instance.errorMessage,
};

const _$PlaybackStateEnumMap = {
  PlaybackState.idle: 'idle',
  PlaybackState.buffering: 'buffering',
  PlaybackState.ready: 'ready',
  PlaybackState.ended: 'ended',
  PlaybackState.error: 'error',
};
