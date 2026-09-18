import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_state.freezed.dart';
part 'player_state.g.dart';

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

  /// A default, empty snapshot — player hasn't started yet.
  factory PlayerStateSnapshot.initial() => const PlayerStateSnapshot(
    state: PlaybackState.idle,
    isPlaying: false,
    position: Duration.zero,
    bufferedPosition: Duration.zero,
    duration: Duration.zero,
  );

  factory PlayerStateSnapshot.fromJson(Map<String, dynamic> json) =>
      _$PlayerStateSnapshotFromJson(json);
}
