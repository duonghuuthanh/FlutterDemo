import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestState();
  }
}

class _TestState extends State<TestScreen> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String result = "";
  String currentResult = "";


  final currencies = ["USD", "EUR", "AUD"];
  String selected = "USD";

  void solve() {
      double? a = double.tryParse(_aController.text);
      double? b = double.tryParse(_bController.text);
      if (a == null || b == null) {
        setState(() {
          result = "Invalid Input!";
        });
      } else {
        String t = "";
        if (a == 0) {
          if (b == 0)
            t = "VSN";
          else
            t = "VN";
        } else {
          t = "x = ${-b/a}";
        }

        setState(() {
          result = t;
        });
      }
  }

  void convert() {
      double? t = double.tryParse(_amountController.text);
      if (t == null) {
        setState(() {
          currentResult = "Invalid amount!";
        });
      } else {
        double r = 0;
        switch (selected) {
          case "USD":
            r = t / 26000;
            break;
          case "EUR":
            r = t / 28000;
            break;
          case "AUD":
            r = t / 18000;
            break;
        }

        setState(() {
          currentResult = "${t} VND = ${r.toStringAsFixed(1)} ${selected}";
        });
      }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          DropdownButton(
            value: selected,
              items: currencies.map((value) {
            return DropdownMenuItem(value: value, child: Text(value));
          }).toList(),
          onChanged: (value) {
              setState(() {
                selected = value!;
              });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(value!))
            );
          }),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                label: Text("Input amount"),
                border: OutlineInputBorder()
            ),
          ),
          IconButton(onPressed: convert, icon: Icon(Icons.currency_exchange)),
          Text(
            currentResult,
            style: TextStyle(fontSize: 20, color: Colors.red),),


          SizedBox(height: 30,),
          TextField(
            controller: _aController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                label: Text("Input a"),
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: _bController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                label: Text("Input b"),
                border: OutlineInputBorder()
            ),
          ),
          ElevatedButton(onPressed: solve, child: Text("Solve")),
          Text(
            result,
            style: TextStyle(fontSize: 30, color: Colors.blue),)
        ],
      ),
    );
  }
}