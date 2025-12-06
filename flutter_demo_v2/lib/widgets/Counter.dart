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
      this._count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter: ${this._count}", style: TextStyle(fontSize: 30, color: Colors.blue)),
            ElevatedButton(onPressed: update, child: Text("Click me!"))
          ],
        )
    );
  }
}