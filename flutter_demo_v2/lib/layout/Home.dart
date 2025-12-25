import 'package:flutter/material.dart';
import 'package:flutter_demo_v2/layout/Category.dart';
import 'package:flutter_demo_v2/layout/Details.dart';
import 'package:flutter_demo_v2/layout/Task.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainState();
  }
}

class _MainState extends State<MainScreen> {

  int _currentIndex = 0;
  final List<Widget> _screens = [
    TaskScreen(),
    CategoryScreen(),
    DetailsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
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
            icon: Icon(Icons.task),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Details',
          ),
        ]
      ),
    );
  }
}