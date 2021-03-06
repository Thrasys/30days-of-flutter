import 'dart:math';

import 'package:flutter/material.dart';

class PickWiget extends StatefulWidget {
  PickWiget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _PickWigetState createState() => _PickWigetState();
}

class _PickWigetState extends State<PickWiget> {
  List<String> restaurants = [
    'Bobs',
    'McDonalds´s',
    'Roscoe´s Chicken & Waffles',
    'BurguerKing',
    'Pizza Hut',
    'PapaJohns'
  ];

  late int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Whats do you want to eat!?'),
            if (_currentIndex != null)
              Text(
                restaurants[_currentIndex],
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            Padding(padding: EdgeInsets.only(top: 50)),
            FlatButton(
              onPressed: () {
                updateIndex();
              },
              child: Text('Pick Restaurant'),
              color: Colors.purple,
              textColor: Colors.white,
            )
          ],
        )),
      ),
    );
  }

  //metodo atualizar tela
  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);
    setState(() {
      _currentIndex = index;
    });
  }
}
