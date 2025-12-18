import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo_v1/models/Category.dart';
import 'package:http/http.dart' as http;

class ApiDemoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ApiState();
  }

}

class _ApiState extends State<ApiDemoScreen> {
  bool isGrid = false;

  Future<List<Category>> loadCategories() async {
    Uri uri = Uri.parse("https://6943460869b12460f3141dc5.mockapi.io/categories");
    final res = await http.get(uri);

    if (res.statusCode == 200) {
      List data = jsonDecode(res.body); // json
      return data.map((json) => Category.fromJson(json)).toList(); // flutter object
    } else {
      throw Exception("Something error!");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("API DEMO"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isGrid = !isGrid;
                });
              },
              icon: Icon(isGrid==true?Icons.grid_view:Icons.list)
          )
        ],
      ),
      body: FutureBuilder<List<Category>>(
        future: loadCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );
          }

          final categories = snapshot.data!;

          if (isGrid) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final c = categories[index];
                  return Card(
                    child: Center(
                      child: Text(c.name, style: TextStyle(fontSize: 30, color: Colors.blue,)),
                    ),
                  );
                },
            );
          } else
            return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final c = categories[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(c.id),),
                    title: Text(c.name),
                  );
                }
            );
        },
      ),
    );
  }
}