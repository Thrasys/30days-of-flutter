import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _screenshotController = ScreenshotController();
  final _statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          Text("Screen Shots"),
          Center(child: Text("Images")),
          Screenshot(
            controller: _screenshotController,
            child: Card(
                child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.asset('images/codepassionately.jpg'),
                ],
              ),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 350,
            height: 50,
            child: TextFormField(
              controller: _statusController,
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: "Enter status here...",
                  border: OutlineInputBorder()),
            ),
          ),
          TextButton(
            child: Text('Take Screenshot and Share'),
            onPressed: _takeScreenshot,
          )
        ]))));
  }

  void _takeScreenshot() async {
    final value = _statusController.text;
    final imageFile = await _screenshotController.capture();
    Share.shareFiles([imageFile.path], text: "$value");
  }
}
