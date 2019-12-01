import 'dart:async';

class ActiveAudioIndexBloc {
  var _activeAudioIndexController = StreamController<int>.broadcast();

  Function(int) get updateActiveAudioIndex =>
      _activeAudioIndexController.sink.add;

  Stream<int> get streamActiveAudioIndex => _activeAudioIndexController.stream;

  dispose() {
    _activeAudioIndexController.close();
  }
}

ActiveAudioIndexBloc activeAudioIndexBloc = ActiveAudioIndexBloc();