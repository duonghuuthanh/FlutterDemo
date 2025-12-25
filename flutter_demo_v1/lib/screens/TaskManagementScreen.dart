import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo_v1/models/Category.dart';
import 'package:flutter_demo_v1/models/Task.dart';
import 'package:flutter_demo_v1/screens/AddTaskScreen.dart';
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
  // TextEditingController _subjectController = TextEditingController();
  // TextEditingController _contentController = TextEditingController();
  // Priority _selectedPriority = Priority.low;
  // String? _selectedCategory;
  // bool _submitting = false;
  String? cateId;
  List<Task> tasks = [];

  _TaskState({this.cateId});

  Future<bool> deleteTask(Task task) async {
    Uri uri = Uri.parse("https://6943683669b12460f3147816.mockapi.io/tasks/${task.id}");
    final res = await http.delete(uri);
    return res.statusCode == 200;
  }

  // Future<bool> addTask(Task task) async {
  //   Uri uri = Uri.parse("https://6943683669b12460f3147816.mockapi.io/tasks");
  //   final res = await http.post(
  //       uri,
  //       headers: {
  //         "Content-Type": "application/json"
  //       },
  //       body: jsonEncode(task.toJson())
  //   );
  //   return res.statusCode == 201;
  // }

  // void add() async {
  //   setState(()  => _submitting = true );
  //
  //   try {
  //     Task t = Task(
  //       subject: _subjectController.text,
  //       content: _contentController.text,
  //       priority: _selectedPriority.name,
  //       category: _selectedCategory!
  //     );
  //
  //     final res = await addTask(t);
  //     if (res == true) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("Add task successful!"))
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("Add task failed!"))
  //       );
  //     }
  //
  //   } catch (ex) {
  //     print(ex.toString());
  //   } finally {
  //     setState(()  => _submitting = false );
  //   }
  // }

  void delete(Task t) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are you sure to delete this task?"),
            actions: [
              ElevatedButton(onPressed: () async {
                final res = await deleteTask(t);
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
              }, child: Text("OK")),
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text("Cancel")),
            ],
          );
        },
    );
  }

  Future<List<Task>> loadTasks() async {
    String u = "https://6943683669b12460f3147816.mockapi.io/tasks";
    if (cateId != null && cateId!.isNotEmpty == true)
      u = "${u}?category=${cateId}";

    Uri uri = Uri.parse(u);
    final res = await http.get(uri);

    if (res.statusCode == 200) {
      List data = jsonDecode(res.body);
      return data.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception("Something error!");
    }
  }

  // Future<List<Category>> loadCategories() async {
  //   Uri uri = Uri.parse("https://6943683669b12460f3147816.mockapi.io/categories");
  //   final res = await http.get(uri);
  //
  //   if (res.statusCode == 200) {
  //     List data = jsonDecode(res.body); // json
  //     return data.map((json) => Category.fromJson(json)).toList(); // flutter object
  //   } else {
  //     throw Exception("Something error!");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Management ${cateId != null ? cateId:""}")),
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
            Expanded(
                child: FutureBuilder(
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
                        Task t = tasks[index];
                        return ListTile(
                          leading: CircleAvatar(child: Text(t.id.toString())),
                          title: Text(t.subject),
                          subtitle: Text(t.content),
                          trailing: IconButton(
                              onPressed: () {
                                delete(t);
                              },
                              icon: Icon(Icons.close, color: Colors.red, size: 30)
                          ),
                        );
                      },
                    );
                  },
                )
            )
          ],
        ),
      ),
    );
  }
}