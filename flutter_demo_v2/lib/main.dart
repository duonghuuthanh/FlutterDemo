import 'package:flutter/material.dart';
import 'package:flutter_demo_v2/layout/Home.dart';
import 'package:flutter_demo_v2/screens/ApiDemoScreen.dart';
import 'package:flutter_demo_v2/screens/ProductManager.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: ApiDemoScreen(),
    );
  }
}

