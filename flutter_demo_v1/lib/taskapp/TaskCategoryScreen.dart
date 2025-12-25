import 'package:flutter/material.dart';

class TaskCategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TaskCategoryState();
  }
}

class _TaskCategoryState extends State<TaskCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Task Categories"),
      // ),
      body: Center(
        child: Text(
          "Task Categories",
          style: TextStyle(fontSize: 40, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}