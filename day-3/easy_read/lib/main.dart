import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _fontSize = 40;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: new TextField(
                textInputAction: TextInputAction.done,
                style: TextStyle(fontSize: _fontSize),
                maxLines: null,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text('Zoom'),
                Slider(
                  value: _fontSize,
                  onChanged: (newSize) {
                    setState(() => _fontSize = newSize);
                  },
                  min: 10,
                  max: 100,
                ),
                // IconButton(
                //   icon: Icon(
                //     Icons.zoom_in,
                //     size: 40,
                //   ),
                //   onPressed: () {},
                // ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
