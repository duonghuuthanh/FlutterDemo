import 'dart:math';
import 'package:flutter/material.dart';

class GridViewTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestState();
  }

}

class _TestState extends State<GridViewTest> {
  List<String> products = List.generate(5, (idx) {
    return "Product ${idx}";
  });

  @override
  Widget build(BuildContext context) {
    Random r = Random();
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            String p = products[index];
            return Container(
              child: Text(p),
              color: Color.fromARGB(255, r.nextInt(256), r.nextInt(256), r.nextInt(256)),
            );
          }
      ),
      floatingActionButton: ElevatedButton(onPressed: () {
        setState(() {
          products.add("Product ${r.nextInt(100)}");
        });
      }, child: Text("Add Product")),
    );
  }
}