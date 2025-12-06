import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
      return _TestState();
  }
}

class _TestState extends State<TestScreen> {
  final _aController = TextEditingController();
  final _bController = TextEditingController();
  final _amountController = TextEditingController();
  String result = "";
  String currenyResult = "";

  final currencies = ["USD", "EUR", "AUD"];
  String selected = "USD";

  Map<String, double> data = {
    "USD": 26000,
    "EUR": 28000,
    "AUD": 18000,
    "ABC": 10000
  };

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
        } else
          t = "x = ${-b/a}";


        setState(() {
          result = t;
        });
      }
  }

  void convert() {
    double? amount = double.tryParse(_amountController.text);
    if (amount == null) {
      setState(() {
        currenyResult = "Invalid amount!";
      });
    } else {
      double t = amount/data[selected]!;
      // switch (selected) {
      //   case "USD":
      //     t = amount/26000;
      //     break;
      //   case "EUR":
      //     t = amount/28000;
      //     break;
      //   case "AUD":
      //     t = amount/18000;
      //     break;
      // }

      setState(() {
        currenyResult = "${amount} VND = ${t.toStringAsFixed(1)} ${selected}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: selected,
            items: data.keys.map((c) {
              return DropdownMenuItem(
                value: c,
                child: Text(c)
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selected = value!;
              });
          }),
          TextField(
            controller: _amountController,
            decoration: InputDecoration(
                label: Text("Input amount"),
                border: OutlineInputBorder(),
                icon: Icon(Icons.currency_bitcoin)
            ),
            keyboardType: TextInputType.number,
          ),
          IconButton(onPressed: convert, icon: Icon(Icons.currency_exchange)),

          Text(currenyResult, style: TextStyle(fontSize: 20, color: Colors.red),),

          SizedBox(height: 30),
          TextField(
            controller: _aController,
            decoration: InputDecoration(
              label: Text("Input a"),
              border: OutlineInputBorder(),
              icon: Icon(Icons.numbers)
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20,),
          TextField(
            controller: _bController,
            decoration: InputDecoration(
                label: Text("Input b"),
                border: OutlineInputBorder(),
                icon: Icon(Icons.numbers)
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: solve, child: Text("Solve!")),
          SizedBox(height: 20,),
          Text(result, style: TextStyle(fontSize: 25, color: Colors.blue),)
        ],
      ),
    );
  }
}