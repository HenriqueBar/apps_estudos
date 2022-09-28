import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'example_event.dart';

part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial()) {
    on<ExampleFindNameEvent>(_findNames);
    on<ExampleRemoveNameEvent>(_removenames);
    on<ExampleAddNameEvent>(_addnames);
  }

  FutureOr<void> _findNames(
    ExampleFindNameEvent event,
    Emitter<ExampleState> emit,
  ) async {
    final names = [
      'Rodrigo Rahman',
      'Academia do Flutter',
      'Flutter',
      'Dart',
      'Flutter Bloc'
    ];
    await Future.delayed(const Duration(seconds: 5));
    emit(ExampleStateData(names: names));
  }

  FutureOr<void> _removenames(
      ExampleRemoveNameEvent event, Emitter<ExampleState> emit) {
    final stateExample = state;

    if (stateExample is ExampleStateData) {
      //... é o spred operator pra duplicar a lista
      final names = [...stateExample.names];
      //essa cara vai reter todos os caras que são falso(se nao for o que eu quero ele vai deletar dad lista)
      names.retainWhere((element) => element != event.name);
      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _addnames(ExampleAddNameEvent event, Emitter<ExampleState> emit) {
    final stateExample = state;
    if(stateExample is ExampleStateData) {
      final names = [...stateExample.names];
      names.add(event.name);
      emit(ExampleStateData(names: names));
    }
  }
}
