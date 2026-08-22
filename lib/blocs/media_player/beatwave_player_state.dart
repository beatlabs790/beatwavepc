// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'beatwave_player_cubit.dart';

class BeatWavePlayerState {
  bool isReady;
  bool showLyrics;
  BeatWavePlayerState({required this.isReady, this.showLyrics = false});
}

final class BeatWavePlayerInitial extends BeatWavePlayerState {
  BeatWavePlayerInitial() : super(isReady: false);
}

/// Simplified progress bar data using only [Duration] values,
/// decoupled from any audio library types.
class ProgressBarStreams {
  final Duration position;
  final Duration duration;
  final Duration buffered;
  final bool isPlaying;
  ProgressBarStreams({
    required this.position,
    required this.duration,
    required this.buffered,
    required this.isPlaying,
  });
}
