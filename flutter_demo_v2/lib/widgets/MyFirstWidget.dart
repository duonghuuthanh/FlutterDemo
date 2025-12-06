import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // width: 100,
          height: 100,
          color: Colors.red,
          child: Center(
            child: Text("A", style: TextStyle(color: Colors.white),),
          ),
        ),
        Container(
          // width: 100,
          height: 100,
          color: Colors.green,
          child: Center(
            child: Text("B", style: TextStyle(color: Colors.white),),
          ),
        ),
        Container(
          // width: 100,
          height: 100,
          color: Colors.blue,
          child: Center(
            child: Text("C", style: TextStyle(color: Colors.white),),
          ),
        ),
        Container(
          // width: 100,
          height: 100,
          color: Colors.blue,
          child: Center(
            child: Text("C", style: TextStyle(color: Colors.white),),
          ),
        ),
        Container(
          // width: 100,
          height: 100,
          color: Colors.blue,
          child: Center(
            child: Text("C", style: TextStyle(color: Colors.white),),
          ),
        ),
        Container(
          // width: 100,
          height: 100,
          color: Colors.blue,
          child: Center(
            child: Text("C", style: TextStyle(color: Colors.white),),
          ),
        )
      ],
    );
  }
}