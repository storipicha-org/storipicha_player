import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_state.freezed.dart';
part 'player_state.g.dart'; // 👈 Needed for JSON serialization

/// Represents the fundamental status of the underlying native player.
enum PlaybackState { idle, buffering, ready, ended, error }

/// Value container describing real-time player dynamics.
@freezed
abstract class PlayerStateSnapshot with _$PlayerStateSnapshot {
  const factory PlayerStateSnapshot({
    required PlaybackState state,
    required bool isPlaying,
    required Duration position,
    required Duration bufferedPosition,
    required Duration duration,
    String? errorMessage,
  }) = _PlayerStateSnapshot;

  // 👈 Added fromJson factory for deserializing EventChannel maps
  factory PlayerStateSnapshot.fromJson(Map<String, dynamic> json) =>
      _$PlayerStateSnapshotFromJson(json);
}
