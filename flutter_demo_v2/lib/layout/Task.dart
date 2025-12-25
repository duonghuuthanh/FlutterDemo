import 'package:flutter/material.dart';
import 'package:flutter_demo_v2/models/Category.dart';
import 'package:flutter_demo_v2/screens/ApiDemoScreen.dart';
import 'package:flutter_demo_v2/screens/TaskManagementScreen.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TaskState();
  }
}

class _TaskState extends State<TaskScreen> {
  List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Task Screen")),
      body: Center(
        child: Column(
          spacing: 20,
          children: [
            Text(
              "Task Screen",
              style: TextStyle(
                fontSize: 45,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                List<Category> data = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ApiDemoScreen()),
                );
                setState(() {
                  categories = data;
                });
              },
              child: Text("Go to Task List"),
            ),

            Expanded(child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                Category c = categories[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(c.id.toString())),
                  title: Text(
                    c.name,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.check, color: Colors.green, size: 30),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
