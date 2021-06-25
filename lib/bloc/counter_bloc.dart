import 'dart:async';
import 'package:BLoC_crashcourse/bloc/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  // State
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  // state, hanya mengekspose stream dan memberikan output berupa data
  Stream<int> get counter => _counterStateController.stream;

  // Event
  final _counterEventController = StreamController<CounterEvent>();
  // event, hanya menekspose sink yang merupakan input
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  // BLoC
  CounterBloc() {
    // ketika ada event baru kapanpun itu, kita akan melakukan map untuk state baru
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) _counter++;
    if (event is DecrementEvent) _counter--;
    _inCounter.add(_counter);
  }

  // akan memberhentikan streamController
  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
