import 'package:flutter/material.dart';

class PositivePage extends StatefulWidget {
  PositivePage({Key key}) : super(key: key);

  @override
  _PositivePageState createState() => _PositivePageState();
}

class _PositivePageState extends State<PositivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.cyan[700],
      ),
    ));
  }
}
