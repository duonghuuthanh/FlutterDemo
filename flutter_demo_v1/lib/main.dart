import 'package:flutter/material.dart';
import 'package:flutter_demo_v1/screens/AddTaskScreen.dart';
import 'package:flutter_demo_v1/screens/ApiDemoScreen.dart';
import 'package:flutter_demo_v1/screens/CourseScreen.dart';
import 'package:flutter_demo_v1/screens/DemoScreen.dart';
import 'package:flutter_demo_v1/screens/TaskManagementScreen.dart';
import 'package:flutter_demo_v1/screens/TestScreen.dart';
import 'package:flutter_demo_v1/taskapp/TaskCategoryScreen.dart';
import 'package:flutter_demo_v1/taskapp/TaskMainScreen.dart';
import 'package:flutter_demo_v1/taskapp/TaskScreen.dart';
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
      home: MainTaskScreen(),
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

