import 'package:flutter/material.dart';

import 'CalcWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day-2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalcWidget(title: 'Pic-Calculator'),
    );
  }
}
