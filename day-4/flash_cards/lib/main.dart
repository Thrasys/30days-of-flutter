import 'package:flash_cards/flashcard.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'flashcard_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Flashcard> _flashcards = [
    Flashcard(
        question: "What programming language does Flutter use?",
        answer: "Dart"),
    Flashcard(question: "Who you gonna call??", answer: "Ghostbusters!"),
    Flashcard(
        question: "Flutter is a Framework or SDK??", answer: "SDK - Kit dev"),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // primary: true,
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            // pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Questions'),
              centerTitle: true,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: FlipCard(
                        // key: cardKey,
                        flipOnTouch: false,
                        front: FlashCardView(
                          text: _flashcards[_currentIndex].question,
                        ),
                        back: FlashCardView(
                          text: _flashcards[_currentIndex].answer,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlineButton.icon(
                        icon: Icon(Icons.chevron_left),
                        label: Text('Prev'),
                        onPressed: showNextCard,
                      ),
                      OutlineButton.icon(
                        label: Text('Next'),
                        icon: Icon(Icons.chevron_right),
                        onPressed: showPrevCard,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]))
          // ...rest of body...
        ],
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPrevCard() {
    _currentIndex =
        (_currentIndex - 1 >= 0) ? _currentIndex : _flashcards.length - 1;
  }
}
