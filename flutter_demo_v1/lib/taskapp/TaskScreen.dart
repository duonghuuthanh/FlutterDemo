import 'package:flutter/material.dart';

class TaskListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TaskListState();
  }
}

class _TaskListState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Task List"),
      // ),
      body: Center(
        child: Text(
          "Task List",
          style: TextStyle(fontSize: 40, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}