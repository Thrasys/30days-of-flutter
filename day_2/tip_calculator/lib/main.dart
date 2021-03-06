import 'package:flutter/material.dart';

import 'CalcWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day-2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalcWidget(),
    );
  }
}
