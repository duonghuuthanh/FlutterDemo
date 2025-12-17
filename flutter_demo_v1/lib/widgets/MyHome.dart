
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Flexible(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: Center(
                child: Text("01", style: TextStyle(fontSize: 60, color: Colors.white)),
              ),
            )
        ),
        Flexible(
            flex: 2,
            child: Row(
              children: [
                Flexible(child: Container(color: Colors.teal,)),
                Flexible(child: Container(color: Colors.tealAccent,)),
              ],
            )
        ),
        Flexible(
            flex: 1,
            child: Container(
              color: Colors.blue,
                child: Center(
                  child: Text("03", style: TextStyle(fontSize: 60, color: Colors.white),),
                )
            )
        )
      ],
    );
  }
}