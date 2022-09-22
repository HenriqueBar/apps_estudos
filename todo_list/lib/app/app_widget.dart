import 'package:flutter/material.dart';
import 'modules/splash/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
  }

  class _AppWidgetState extends State<AppWidget> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(observer)
  }

  @override
  Widget build(BuildContext context) {
      return const MaterialApp(
        title: 'Todo List Provider',
        home: SplashPage(),
      );
  }


  }
