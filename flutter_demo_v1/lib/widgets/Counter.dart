import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void update() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Counter = $_count", style: TextStyle(fontSize: 35)),
        ElevatedButton(onPressed: update, child: Text("Click me!"))
      ],
    );
  }
}