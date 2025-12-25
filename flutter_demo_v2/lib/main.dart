import 'package:flutter/material.dart';
import 'package:flutter_demo_v2/taskapp/MainScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MainScreen(),
    );
  }
}

