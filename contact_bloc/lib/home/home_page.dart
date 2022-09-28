import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/bloc/example/');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: const Card(
                    elevation: 8.0,
                    child: Text('Example'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/contacts/list/');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: const Card(
                    elevation: 8.0,
                    child: Text('Contact'),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
