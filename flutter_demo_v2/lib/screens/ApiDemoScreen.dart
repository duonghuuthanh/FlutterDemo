import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo_v2/models/Category.dart';
import 'package:flutter_demo_v2/screens/TaskManagementScreen.dart';
import 'package:http/http.dart' as http;

class ApiDemoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ApiState();
  }
}

class _ApiState extends State<ApiDemoScreen> {
  bool isGrid = false;
  Future<List<Category>>? t;
  List<Category> categories = [];

  Future<List<Category>> loadCategories() async {
    Uri uri = Uri.parse("https://6943683669b12460f3147816.mockapi.io/categories");
    final res = await http.get(uri);

    if (res.statusCode == 200) {
      List data = jsonDecode(res.body);

      return data.map((json) => Category.fromJson(json)).toList();
    } else
      throw Exception("Something wrong!");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    t = loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, categories);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("API DEMO",),
          actions: [
            IconButton(onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            }, icon: Icon(isGrid==true?Icons.grid_view:Icons.list))
          ],
        ),
        body: FutureBuilder(
          future: t,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text("Error ${snapshot.error}"),
              );
            }
            categories = snapshot.data!;
            if (isGrid)
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  Category c = categories[index];
                  return Padding(padding: EdgeInsetsGeometry.all(8),
                    child: Card(
                      child: Center(
                        child: Text(c.name, style: TextStyle(fontSize: 30, color: Colors.blue),),
                      ),
                    ),);
                },
              );

            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                Category c = categories[index];
                return ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return TaskManagementScreen(cateId: c.id);
                      }));
                    },
                    child: CircleAvatar(child: Text(c.id)),
                  ),
                  title: Text(c.name),
                );
              },
            );
          },
        ),
      ),
    );

  }
}