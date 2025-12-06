
import 'dart:math';

import 'package:flutter/material.dart';

class ProductGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductState();
  }
}

class _ProductState extends State<ProductGridView> {
  List<String> products = List.generate(10, (index) {
    return "Product ${index + 1}";
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Random r = Random();
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
        ),
        itemCount: products.length,
        itemBuilder: (content, index) {
          String p = products[index];
          return Container(
            height: 100,
            color: Color.fromARGB(255, r.nextInt(256), r.nextInt(256), r.nextInt(256)),
            child: Center(
              child: Text(p, style: TextStyle(color: Colors.white),),
            ),
          );
        },
      ),
      floatingActionButton: ElevatedButton(onPressed: () {
        setState(() {
          this.products.add("Product ${this.products.length + 1}");
        });
      }, child: Icon(Icons.add, size: 40)),
    );
  }
}