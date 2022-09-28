import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment(){
    emit(CounterStateData(state.counter + 1));
  }
  void decremente(){
    emit(CounterStateData(state.counter - 1));
  }
}
