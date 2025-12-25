import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo_v1/models/Category.dart';
import 'package:flutter_demo_v1/models/Task.dart';
import 'package:http/http.dart' as http;

class AddTaskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTaskScreen> {
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  Priority _selectedPriority = Priority.low;
  String? _selectedCategory;
  bool _submitting = false;

  Future<List<Category>> loadCategories() async {
    Uri uri = Uri.parse("https://6943683669b12460f3147816.mockapi.io/categories");
    final res = await http.get(uri);

    if (res.statusCode == 200) {
      List data = jsonDecode(res.body); // json
      return data.map((json) => Category.fromJson(json)).toList(); // flutter object
    } else {
      throw Exception("Something error!");
    }
  }

  Future<bool> addTask(Task task) async {
    Uri uri = Uri.parse("https://6943683669b12460f3147816.mockapi.io/tasks");
    final res = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json"
        },
        body: jsonEncode(task.toJson())
    );
    print(res.body);
    return res.statusCode == 201;
  }

  void add() async {
    setState(()  => _submitting = true);

    try {
      Task t = Task(
          subject: _subjectController.text,
          content: _contentController.text,
          priority: _selectedPriority.name,
          category: _selectedCategory!
      );

      final res = await addTask(t);
      if (res == true) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Add task successful!"))
        );

        Navigator.pop(context, t);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Add task failed!"))
        );
      }

    } catch (ex) {
      print(ex.toString());
    } finally {
      setState(()  => _submitting = false );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
          padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            TextField(
                controller: _subjectController,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    label: Text("Task Subject"),
                    hint: Text("Enter task subject...")
                )
            ),
            SizedBox(height: 20),
            TextField(
                controller: _contentController,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    label: Text("Task Content"),
                    hint: Text("Enter task content...")
                )
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<Priority>(
                initialValue: _selectedPriority,
                items: Priority.values.map((p) {
                  return DropdownMenuItem(
                      value: p,
                      child: Text(p.name)
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPriority = value!;
                  });
                }
            ),
            SizedBox(height: 20),
            FutureBuilder(
              future: loadCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                List<Category> categories = snapshot.data!;
                return DropdownButtonFormField<String>(
                    initialValue: _selectedCategory,

                    items: categories.map((c) {
                      return DropdownMenuItem(
                          value: c.id,
                          child: Text(c.name)
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: add,
                child: _submitting?
                const CircularProgressIndicator()
                    :Text("Add Task")
            )
          ],
        ),

      ),
    );
  }
}