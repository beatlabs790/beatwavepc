import 'package:beatwave/services/beatwave_player.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
part 'beatwave_player_state.dart';

class BeatWavePlayerCubit extends Cubit<BeatWavePlayerState> {
  final BeatWaveMusicPlayer beatwavePlayer;
  late ValueStream<ProgressBarStreams> progressStreams;

  BeatWavePlayerCubit(this.beatwavePlayer)
      : super(BeatWavePlayerState(isReady: true)) {
    beatwavePlayer.syncPublicState();
    _setupProgressStreams();
  }

  void switchShowLyrics({bool? value}) {
    emit(BeatWavePlayerState(
        isReady: true, showLyrics: value ?? !state.showLyrics));
  }

  void _setupProgressStreams() {
    progressStreams = Rx.combineLatest4(
      Rx.defer(() => beatwavePlayer.engine.positionStream, reusable: true),
      Rx.defer(() => beatwavePlayer.engine.durationStream, reusable: true),
      Rx.defer(() => beatwavePlayer.engine.bufferedStream, reusable: true),
      Rx.defer(() => beatwavePlayer.engine.playingStream, reusable: true),
      (Duration position, Duration duration, Duration buffered, bool playing) =>
          ProgressBarStreams(
        position: position,
        duration: duration,
        buffered: buffered,
        isPlaying: playing,
      ),
    ).shareValueSeeded(
      ProgressBarStreams(
        position: Duration.zero,
        duration: Duration.zero,
        buffered: Duration.zero,
        isPlaying: false,
      ),
    );
  }

  @override
  Future<void> close() {
    // Intentionally does NOT stop the player.
    // The AudioService foreground service manages its own lifecycle via
    // onTaskRemoved() / onNotificationDeleted().
    return super.close();
  }
}
