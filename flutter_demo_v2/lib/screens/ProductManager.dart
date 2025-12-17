import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_v2/models/Product.dart';

class ProductManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductManager();
  }
}

class _ProductManager extends State<ProductManager> {
  List<Product> products = [];
  List<Product> filteredProducts = [];

  Map<String, bool> categories = {
    "Electronics": true,
    "Fashion": true,
    "Home": true,
  };

  bool showOnlyActive = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadProducts();
  }

  void applyFilters() {
    setState(() {
      final selectedCategories = categories.entries
          .where((e) => e.value == true)
          .map((e) => e.key)
          .toList();

      filteredProducts = products.where((p) {
        final matchCategory = selectedCategories.contains(p.category);
        final matchActive = showOnlyActive ? p.active == true : true;
        return matchCategory && matchActive;
      }).toList();
    });
  }

  Future<void> loadProducts() async {
    print(Random().nextInt(1000));
    final res = await rootBundle.loadString("assets/products.json"); // Đọc file JSON trong assets
    print(res);
    final List<dynamic> data = json.decode(res);

    setState(() {
      products = data.map((item) => Product.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: categories.keys.map((String key) {
            return Row(
              children: [
                Checkbox(
                  value: categories[key],
                  onChanged: (value) {
                    categories[key] = value!;
                    applyFilters();
                  },
                ),
                Text(key),
              ],
            );
          }).toList(),
        ),

        // Active switch
        SwitchListTile(
          title: Text("Show only active products"),
          value: showOnlyActive,
          onChanged: (value) {
            showOnlyActive = value;
            applyFilters();
          },
        ),

        Expanded(child: filteredProducts.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final p = filteredProducts[index];
            return ListTile(
              leading: CircleAvatar(child: Text(p.id.toString())),
              title: Text(p.name),
              subtitle: Text("Category: ${p.category}"),
              trailing:
              p.active ? Icon(Icons.check, color: Colors.green) : Icon(Icons.close, color: Colors.red),
            );
          },
        ))
      ],
    );
  }
}