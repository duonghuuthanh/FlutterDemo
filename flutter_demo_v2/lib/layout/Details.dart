import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Details Screen"),
        ),
        body: Center(
          child: Text("Details Screen", style: TextStyle(fontSize: 45, color: Colors.blue, fontWeight: FontWeight.bold)),
        )
    );
  }
}