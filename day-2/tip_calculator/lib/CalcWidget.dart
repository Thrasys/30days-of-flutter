import 'package:flutter/material.dart';

class CalcWidget extends StatefulWidget {
  CalcWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalcWidgetState createState() => _CalcWidgetState();
}

class _CalcWidgetState extends State<CalcWidget> {
  final controller = TextEditingController();

  List<bool> _selection = [true, false, false];

  String tip = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (tip != 'null')
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    tip,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              Text("Total Amount"),
              SizedBox(
                width: 70,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: '\$100.00'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ToggleButtons(children: [
                  Text('10%'),
                  Text('15%'),
                  Text('20%'),
                ], isSelected: _selection, onPressed: updateSelection),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: calculateTip,
                child: Text('Calculate Tip'),
                color: Colors.green,
                textColor: Colors.white,
              )
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  void updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectedIndex == i;
      }
    });
  }

  void calculateTip() {
    final totalAmount = double.parse(controller.text);
    final selectedIndex = _selection.indexWhere((element) => false);
    final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];

    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);

    setState(() {
      tip = '\$$tipTotal';
    });
  }
}
