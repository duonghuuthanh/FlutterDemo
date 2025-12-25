
import 'package:flutter/material.dart';
import 'package:flutter_demo_v2/widgets/ItemWidget.dart';

class Course extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Course List"),),
      body: ListView(
        children: [
          ItemWidget(title: "Software Engineering",),
          ItemWidget(title: "Software Testing",),
          ItemWidget(title: "Software Engineering 1",),
          ItemWidget(title: "Software Engineering 2",),
          ItemWidget(title: "Software Engineering 3",),
          ItemWidget(title: "Software Engineering",),
          ItemWidget(title: "Software Testing",),
          ItemWidget(title: "Software Engineering 1",),
          ItemWidget(title: "Software Engineering 2",),
          ItemWidget(title: "Software Engineering 3",),
          ItemWidget(title: "Software Engineering",),
          ItemWidget(title: "Software Testing",),
          ItemWidget(title: "Software Engineering 1",),
          ItemWidget(title: "Software Engineering 2",),
          ItemWidget(title: "Software Engineering 3",),

        ],
      ),
    );
  }
}