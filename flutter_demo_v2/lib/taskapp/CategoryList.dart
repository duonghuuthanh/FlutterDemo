import 'package:flutter/material.dart';

class CategoryListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryListState();
  }
}

class _CategoryListState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text("Task Category", style: TextStyle(fontSize: 40, color: Colors.blue, fontWeight: FontWeight.bold)),
      ),
    );
  }
}