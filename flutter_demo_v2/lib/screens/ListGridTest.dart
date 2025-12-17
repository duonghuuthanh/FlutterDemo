import 'package:flutter/material.dart';

class SwitchViewExample extends StatefulWidget {
  @override
  State<SwitchViewExample> createState() => _SwitchViewExampleState();
}

class _SwitchViewExampleState extends State<SwitchViewExample> {
  bool isGrid = false;

  // Fake data (bạn thay bằng products từ JSON)
  List<Map<String, dynamic>> products = [
    {"id": 1, "name": "Laptop"},
    {"id": 2, "name": "Shirt"},
    {"id": 3, "name": "Phone"},
    {"id": 4, "name": "Shoes"},
    {"id": 5, "name": "Fridge"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List ⇆ Grid Demo"),

        // Nút đổi chế độ
        actions: [
          IconButton(
            icon: Icon(isGrid ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          )
        ],
      ),

      body: isGrid ? buildGridView() : buildListView(),
    );
  }

  // -------------------- LIST VIEW --------------------
  Widget buildListView() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(child: Text(products[index]["id"].toString())),
          title: Text(products[index]["name"]),
          onTap: () {},
        );
      },
    );
  }

  // -------------------- GRID VIEW --------------------
  Widget buildGridView() {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 cột
        childAspectRatio: 3 / 2, // Tỷ lệ item
      ),
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8),
          child: Center(
            child: Text(
              products[index]["name"],
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      },
    );
  }
}