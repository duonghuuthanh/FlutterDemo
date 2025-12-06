import 'dart:math';

import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String image;

  Product(this.name, this.price, this.image);
}

class ProductList extends StatelessWidget {
  final products = List.generate(
    30,
    (i) =>
        Product("Product ${i + 1}", 1000 + Random().nextDouble()*1000, "https://res.cloudinary.com/dxxwcby8l/image/upload/v1764398169/bcszpvjt4cxccqk7bsni.jpg"),
  );


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 2; // default: mobile
    if (width >= 900) {
      crossAxisCount = 6; // large screen
    } else if (width >= 600) {
      crossAxisCount = 4; // tablet
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (content, index) {
        final item = products[index];
        return GestureDetector(
          child: Card(
            elevation: 3,
            margin: EdgeInsetsGeometry.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    item.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "\$${item.price.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
