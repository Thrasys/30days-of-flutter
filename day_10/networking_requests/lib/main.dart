import 'package:flutter/material.dart';
import 'package:networking_requests/data_service.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _dataService = DataService();
  String _response;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(builder: (_) {
            if (_response != null) {
              return ListView(
                children: [
                  Expanded(
                    child: Text(_response),
                  ),
                ],
              );
            } else {
              return ElevatedButton(
                child: Text("Make Request"),
                onPressed: _makeRequest,
              );
            }
          }),
        ),
      ),
    );
  }

  void _makeRequest() async {
    final response = await _dataService.makeRequestsToApi();
    setState(() => _response = response);
  }
}
