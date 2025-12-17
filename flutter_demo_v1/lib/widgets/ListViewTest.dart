
import 'package:flutter/material.dart';

class ListViewTester extends StatelessWidget {
  List<String> products = List.generate(5, (index) {
    return 'MY PRODUCT $index';
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
          String p = products[index];

          return ListTile(
            leading: Icon(Icons.person, size: 60),
            title: Text(p, style: TextStyle(fontSize: 35, color: Colors.blue),),
            trailing: Icon(Icons.arrow_forward),
          );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return ListView(
  //     padding: EdgeInsetsGeometry.all(20),
  //     children: [
  //       Text("TEST 01", style: TextStyle(fontSize: 50),),
  //       Text("TEST 02", style: TextStyle(fontSize: 50)),
  //       Text("TEST 03", style: TextStyle(fontSize: 50)),
  //       Text("TEST 04", style: TextStyle(fontSize: 50)),
  //       Text("TEST 05", style: TextStyle(fontSize: 50)),
  //       Text("TEST 01", style: TextStyle(fontSize: 50),),
  //       Text("TEST 02", style: TextStyle(fontSize: 50)),
  //       Text("TEST 03", style: TextStyle(fontSize: 50)),
  //       Text("TEST 04", style: TextStyle(fontSize: 50)),
  //       Text("TEST 05", style: TextStyle(fontSize: 50)),
  //       Text("TEST 01", style: TextStyle(fontSize: 50),),
  //       Text("TEST 02", style: TextStyle(fontSize: 50)),
  //       Text("TEST 03", style: TextStyle(fontSize: 50)),
  //       Text("TEST 04", style: TextStyle(fontSize: 50)),
  //       Text("TEST 05", style: TextStyle(fontSize: 50)),
  //     ],
  //   );
  // }
}