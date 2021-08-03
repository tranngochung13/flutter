import 'dart:async';
import 'package:flutter/foundation.dart';

import 'base_event.dart';

abstract class BaseBloc {
  // ignore: close_sinks
  StreamController<BaseEvent> _eventSteamController =
      StreamController<BaseEvent>();

  Sink<BaseEvent> get event => _eventSteamController.sink;

  BaseBloc() {
    _eventSteamController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception('Event k hop le');
      }

      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvent event);

  @mustCallSuper
  void dispose() {
    _eventSteamController.close();
  }
}
