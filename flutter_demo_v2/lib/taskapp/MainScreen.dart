import 'package:flutter/material.dart';
import 'package:flutter_demo_v2/layout/Category.dart';
import 'package:flutter_demo_v2/taskapp/CategoryList.dart';
import 'package:flutter_demo_v2/taskapp/TaskList.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainState();
  }
}

class _MainState extends State<MainScreen> {
  List<Widget> screens = [
    CategoryListScreen(),
    TaskListScreen()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Task App"),
      ),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Category"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: "Task"
            )
          ]
      ),
    );
  }
}