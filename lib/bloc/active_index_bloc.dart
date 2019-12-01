import 'dart:async';

class _ActiveIndexBloc {
  var _activeIndexController = StreamController<int>.broadcast();

  Function(int) get updateActiveIndex => _activeIndexController.sink.add;

  Stream<int> get streamActiveIndex => _activeIndexController.stream;

  dispose() {
    _activeIndexController.close();
  }
}

_ActiveIndexBloc activeIndexBloc = _ActiveIndexBloc();
