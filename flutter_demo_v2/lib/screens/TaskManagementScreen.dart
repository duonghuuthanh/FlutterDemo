import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo_v2/models/Category.dart';
import 'package:flutter_demo_v2/models/Task.dart';
import 'package:flutter_demo_v2/screens/AddTaskScreen.dart';
import 'package:flutter_demo_v2/screens/ApiDemoScreen.dart';
import 'package:flutter_demo_v2/screens/Course.dart';
import 'package:http/http.dart' as http;

class TaskManagementScreen extends StatefulWidget {
  String? cateId;

  TaskManagementScreen({super.key, this.cateId});

  @override
  State<StatefulWidget> createState() {
    return _TaskState(cateId: this.cateId);
  }
}

class _TaskState extends State<TaskManagementScreen> {

  String? cateId;
  List<Task> tasks = [];

  _TaskState({this.cateId});

  Future<List<Task>> loadTasks() async {
    String u = "https://6943683669b12460f3147816.mockapi.io/tasks";

    if (cateId != null)
      u += "?category=${cateId}";

    Uri uri = Uri.parse(u);
    final res = await http.get(uri);

    if (res.statusCode == 200) {
      List data = jsonDecode(res.body);
      return data.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception("Something wrong!");
    }
  }



  Future<bool> deleteTask(String taskId) async {
    Uri uri = Uri.parse("https://6943683669b12460f3147816.mockapi.io/tasks/${taskId}");
    final res = await http.delete(uri);

    return res.statusCode == 200;
  }



  void delete(String taskId) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are you sure to delete this task?"),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              }, child:Text("Cancel")),
              ElevatedButton(onPressed: () async {
                final res = await deleteTask(taskId);
                if (res == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Delete task successful!"))
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Delete task failed!"))
                  );
                }
                Navigator.of(context).pop();
              }, child:Text("OK"))
            ],
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task List"),),
      floatingActionButton: ElevatedButton(onPressed: () async {
          final res = await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddTaskScreen();
          }));

          setState(() {
            tasks.add(res);
          });
      }, child: Icon(Icons.add, size: 30)),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [


            Expanded(child: FutureBuilder(
                future: loadTasks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: const CircularProgressIndicator(),
                    );
                  }

                  this.tasks = snapshot.data!;

                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      Task task = tasks[index];
                      return ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Course()));
                          },
                          child: CircleAvatar(child: Text(task.id.toString())),
                        ),
                        title: Text(task.subject),
                        subtitle: Text(task.content),
                        trailing: IconButton(
                            onPressed: () {
                              delete(task.id.toString());
                            },
                            icon: Icon(Icons.close, color: Colors.red, size: 30)
                        ),
                      );
                    },
                  );
                })
            )
          ],
        ),
      ),
    );
  }
}