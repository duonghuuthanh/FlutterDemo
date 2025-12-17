
import 'package:flutter/material.dart';
import 'package:flutter_demo_v1/widgets/ItemWidget.dart';

class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        ItemWidget(title: "Software Engineering"),
        ItemWidget(title: "Software Engineering 1"),
        ItemWidget(title: "Software Engineering 2"),
        ItemWidget(title: "Software Engineering 3",),
        ItemWidget(title: "Software Engineering 3",),
        ItemWidget(title: "Software Engineering"),
        ItemWidget(title: "Software Engineering 1"),
        ItemWidget(title: "Software Engineering 2"),
        ItemWidget(title: "Software Engineering 3",),
        ItemWidget(title: "Software Engineering 3",),
        ListTile(
          leading: Icon(Icons.person, size: 30,),
          title: Text("TEST"),
          subtitle: Text("test"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("TEST"), duration: Duration(seconds: 1),)
            );
          },
        )
      ],
    );
  }
}