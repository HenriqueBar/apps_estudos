import 'package:flutter/material.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter 10',
            style: Theme.of(context).textTheme.headlineMedium,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
