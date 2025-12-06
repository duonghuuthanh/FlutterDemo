import 'package:flutter/material.dart';
import 'package:flutter_demo_v2/screens/Course.dart';
import 'package:flutter_demo_v2/screens/TestScreeN.dart';
import 'package:flutter_demo_v2/widgets/Button.dart';
import 'package:flutter_demo_v2/widgets/Counter.dart';
import 'package:flutter_demo_v2/widgets/GridViewTest.dart';
import 'package:flutter_demo_v2/widgets/ListViewTest.dart';
import 'package:flutter_demo_v2/widgets/MyHome.dart';
import 'package:flutter_demo_v2/widgets/ProductGridView.dart';
import 'package:flutter_demo_v2/widgets/Test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Demo App"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: TestScreen(),
        bottomNavigationBar: Container(
          color: Colors.teal,
          child: Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, size: 30),
                  Icon(Icons.person, size: 30),
                  Icon(Icons.login, size: 30),
                ],
              ),
          ),
        ),
      ),
    );
  }
}

