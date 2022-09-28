part of 'counter_cubit.dart';

@immutable
abstract class CounterState {

  final int counter;

  const CounterState(this.counter);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterState &&
          runtimeType == other.runtimeType &&
            counter == other.counter;

  @override
  int get hashCode => counter.hashCode;
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterStateData extends CounterState{
  CounterStateData(int counter) : super(counter);
}