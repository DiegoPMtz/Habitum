import 'package:flutter/material.dart';
import 'package:habitum3/screens/home/home.dart';
import 'package:habitum3/screens/positive/positive_habits_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habitum',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => Home(),
          'positive': (BuildContext context) => PositivePage(),
        });
  }
}
