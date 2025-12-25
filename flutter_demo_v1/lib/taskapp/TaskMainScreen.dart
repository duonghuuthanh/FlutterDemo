import 'package:flutter/material.dart';
import 'package:flutter_demo_v1/taskapp/TaskCategoryScreen.dart';
import 'package:flutter_demo_v1/taskapp/TaskScreen.dart';

class MainTaskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainTaskState();
  }
}

class _MainTaskState extends State<MainTaskScreen> {
  List<Widget> screens = [
    TaskCategoryScreen(),
    TaskListScreen()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Task App")),
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: "Task List"),
            BottomNavigationBarItem(icon: Icon(Icons.task, size: 30), label: "Task Categories"),
          ]
      ),
    );
  }
}