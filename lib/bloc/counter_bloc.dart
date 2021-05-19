import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    switch (event) {
      case CounterEvent.increment:
        emit(CounterState(counterValue: state.counterValue + 1));
        break;
      case CounterEvent.decrement:
        emit(CounterState(counterValue: state.counterValue - 1));
        break;
    }
  }
}
