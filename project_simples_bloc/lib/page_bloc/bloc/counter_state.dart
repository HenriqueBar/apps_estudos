part of 'counter_bloc.dart';

@immutable
abstract class CounterState {

  final int counter;
  const CounterState(this.counter);
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterStateData extends CounterState{
  CounterStateData(int counter) : super(counter);
}
