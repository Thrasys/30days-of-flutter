import 'package:flutter/material.dart';

import 'BoardTile.dart';

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
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [Image.asset('images/board.png'), _boardTiles()],
          ),
        ),
      ),
    );
  }

  Widget _boardTiles() {
    return Builder(
      builder: (context) {
        final boardDimension = MediaQuery.of(context).size.width;
        final tileDimension = boardDimension / 3;

        return Container(
          width: boardDimension,
          height: boardDimension,
          child: Column(
            children: [
              Row(
                children: [
                  BoardTile(dimension: tileDimension),
                  BoardTile(dimension: tileDimension),
                  BoardTile(dimension: tileDimension),
                ],
              ),
              Row(
                children: [
                  BoardTile(dimension: tileDimension),
                  BoardTile(dimension: tileDimension),
                  BoardTile(dimension: tileDimension),
                ],
              ),
              Row(
                children: [
                  BoardTile(dimension: tileDimension),
                  BoardTile(dimension: tileDimension),
                  BoardTile(dimension: tileDimension),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
