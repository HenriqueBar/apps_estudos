import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_example.dart';
import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/features/contacts/list/contacts_list_page.dart';
import 'package:contact_bloc/home/home_page.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
  create: (context) => ContactRepository(),
    child: MaterialApp(
      initialRoute: '/home',
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (_) => const HomePage(),
        '/bloc/example/': (_) => BlocProvider(
              //utilizando o cascate notation para preencher os dados ao abrir a pagina
              create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
              child: const BlocExample(),
            ),
        '/contacts/list/': (context) => BlocProvider(
              create: (_) => ContactListBloc(contactRepository: context.read<ContactRepository>()),
              child: const ContactsListPage(),
            ),
      },
      home: const HomePage(),
    ),
);
  }
}
