import 'dart:math';

import 'package:flutter/material.dart';

class DynamicListViewTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListState();
  }
}

class _ListState extends State<DynamicListViewTest> {
  List<String> products = List.generate(10, (index) {
    return "MY PRODUCT ${index}";
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (content, index) {
          String p = products[index];
          return ListTile(
            leading: Icon(Icons.person, size: 60),
            title: Text(p, style: TextStyle(fontSize: 35),),
            trailing: Icon(Icons.arrow_forward, size: 30,),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(p),
                  duration: Duration(seconds: 1),
                ),

              );
            },
          );
        },
      ),
      floatingActionButton: ElevatedButton(onPressed: () {
        setState(() {
          products.add("My Product ${Random().nextInt(1000)}");
        });
      }, child: Icon(Icons.add, size: 30,)),
    );
  }
}

class ListViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text("test 01", style: TextStyle(fontSize: 50),),
          trailing: Icon(Icons.arrow_forward, size: 40,),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Already tapped!"),
                duration: Duration(seconds: 1),
              ),

            );
          },
        ),

        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text("test 02", style: TextStyle(fontSize: 50),),
          trailing: Icon(Icons.arrow_forward, size: 40,),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Already tapped!"))
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text("test 01", style: TextStyle(fontSize: 50),),
          trailing: Icon(Icons.arrow_forward, size: 40,),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Already tapped!"))
            );
          },
        ),

        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text("test 02", style: TextStyle(fontSize: 50),),
          trailing: Icon(Icons.arrow_forward, size: 40,),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Already tapped!"))
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text("test 01", style: TextStyle(fontSize: 50),),
          trailing: Icon(Icons.arrow_forward, size: 40,),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Already tapped!"))
            );
          },
        ),

        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text("test 02", style: TextStyle(fontSize: 50),),
          trailing: Icon(Icons.arrow_forward, size: 40,),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Already tapped!"))
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text("test 01", style: TextStyle(fontSize: 50),),
          trailing: Icon(Icons.arrow_forward, size: 40,),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Already tapped!"))
            );
          },
        ),

        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text("test 02", style: TextStyle(fontSize: 50),),
          trailing: Icon(Icons.arrow_forward, size: 40,),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Already tapped!"))
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text("test 01", style: TextStyle(fontSize: 50),),
          trailing: Icon(Icons.arrow_forward, size: 40,),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Already tapped!"))
            );
          },
        ),

        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text("test 02", style: TextStyle(fontSize: 50),),
          trailing: Icon(Icons.arrow_forward, size: 40,),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Already tapped!"))
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text("test 01", style: TextStyle(fontSize: 50),),
          trailing: Icon(Icons.arrow_forward, size: 40,),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Already tapped!"))
            );
          },
        ),

        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text("test 02", style: TextStyle(fontSize: 50),),
          trailing: Icon(Icons.arrow_forward, size: 40,),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Already tapped!"))
            );
          },
        ),
      ],
    );
  }
}