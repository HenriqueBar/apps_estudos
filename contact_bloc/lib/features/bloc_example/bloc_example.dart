import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExample extends StatelessWidget {
  const BlocExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
      ),
      body:
          // só estucar as alterções sem ter que ficar rebuildando a tela
          BlocListener<ExampleBloc, ExampleState>(
        listenWhen: (previous, current) {
          if (previous is ExampleStateInitial && current is ExampleStateData) {
            return current.names.length > 3;
          }
          return false;
        },
        listener: (context, state) {
          if (state is ExampleStateData) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('A quantidade de nomes é ${state.names.length}'),
              ),
            );
          }
        },
        child: Column(
          children: [
            // é para quando eu quero escutar as alterações e rebuildar a minha tela
            BlocConsumer<ExampleBloc, ExampleState>(
              listener: (context, state) {
                print('Estado alterado para ${state.runtimeType}');
              },
              builder: (_, state) {
                if (state is ExampleStateData) {
                  return Text('Total de nomes é ${state.names.length}');
                }
                return const SizedBox.shrink();
              },
            ),

            // para quando você quer só uma parte
            BlocSelector<ExampleBloc, ExampleState, bool>(
              selector: (state) {
                if (state is ExampleStateInitial) {
                  return true;
                }
                return false;
              },
              builder: (context, showLoader) {
                if (showLoader) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            BlocSelector<ExampleBloc, ExampleState, List<String>>(
              selector: (state) {
                if (state is ExampleStateData) {
                  return state.names;
                }
                return [];
              },
              builder: (context, names) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    final name = names[index];
                    return ListTile(
                      onTap: () {
                        context.read<ExampleBloc>().add(
                              ExampleRemoveNameEvent(name: name),
                            );
                      },
                      title: Text(name),
                    );
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ExampleBloc>().add(ExampleAddNameEvent(name: 'Henrique Sanches'));
              },
              child: Text('Add Name'),
            ),
            /*BlocConsumer<ExampleBloc, ExampleState>(
                listener: listener, builder: builder)*/
/*            BlocBuilder<ExampleBloc, ExampleState>(
              builder: (context, state) {
                if (state is ExampleStateData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.names.length,
                    itemBuilder: (context, index) {
                      final name = state.names[index];
                      return ListTile(
                        title: Text(name),
                      );
                    },
                  );
                }
                return const Text('Nenhum nome cadastrado');
              },
            )*/
          ],
        ),
      ),
    );
  }
}
