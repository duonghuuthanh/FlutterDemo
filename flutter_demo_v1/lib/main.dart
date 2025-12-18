import 'package:flutter/material.dart';
import 'package:flutter_demo_v1/screens/ApiDemoScreen.dart';
import 'package:flutter_demo_v1/screens/CourseScreen.dart';
import 'package:flutter_demo_v1/screens/DemoScreen.dart';
import 'package:flutter_demo_v1/screens/TestScreen.dart';
import 'package:flutter_demo_v1/widgets/Counter.dart';
import 'package:flutter_demo_v1/widgets/GridViewTest.dart';
import 'package:flutter_demo_v1/widgets/ListViewTest.dart';
import 'package:flutter_demo_v1/widgets/MyFirstWidget.dart';
import 'package:flutter_demo_v1/widgets/MyHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Demo App"),
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
        ),
        body: ApiDemoScreen(),
        bottomNavigationBar: Container(
          color: Colors.teal,
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home, size: 30,),
                Icon(Icons.person, size: 30,),
                Icon(Icons.login, size: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       // theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
//       home: Scaffold(
//         appBar: AppBar(title: Text("TEST"), centerTitle: true, backgroundColor: Colors.red,),
//         body: MyFirstWidget(),
//         bottomNavigationBar: Text("hahaHAHAHAH"),
//       ),
//
//     );
//   }
// }

