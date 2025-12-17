import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_v1/models/Book.dart';

class DemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DemoState();
  }
}

class _DemoState extends State<DemoWidget> {
  List<Book> books = [];
  List<Book> filterdBooks = [];
  TextEditingController _controller = TextEditingController();
  bool isActive = false;

  Future<void> loadBooks() async {

      final res = await rootBundle.loadString("assets/data/books.json");
      final List<dynamic> data = json.decode(res);
      books = data.map((item) {
        return Book.fromJson(item);
      }).toList();

      setState(() {
        this.filterdBooks = books;
      });



  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBooks();

    this._controller.addListener(() {
      print("TEST");
      filter();
    });
  }

  void filter() {
    // if (this._controller.text.isNotEmpty) {
      setState(() {
        filterdBooks = books.where((b) {
          bool k = b.name.toLowerCase().contains(this._controller.text);
          if (isActive == true)
            k = k && b.active == true;
          return k;
        }).toList();

      });
    // }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

      return Scaffold(
        appBar: AppBar(
          title: Text("Books Management"),
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsetsGeometry.all(10),
              child: Container(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          label: Text("Enter keyword...")
                      ),
                    ),

                  )),
            ),

            Row(),

            Switch(value: isActive, onChanged: (value) {
              setState(() {
                isActive = value;
              });
              filter();
            }),
            Expanded(child: ListView.builder(
              itemCount: filterdBooks.length,
              itemBuilder: (context, index) {
                final b = this.filterdBooks[index];

                return BookItem(book: b);
              },
            ))
          ],
        ),

    );
  }
}

class BookItem extends StatelessWidget {
  Book book;

  BookItem({required this.book});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              child: Image.asset(
                  this.book.image,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover
              ),
            ),
            Column(
              children: [
                Text(this.book.name, style: TextStyle(fontSize: 20, color: Colors.blue)),
                Text("${this.book.price} VND", style: TextStyle(fontSize: 12, color: Colors.red),)
              ],
            ),

            Text(this.book.category, style: TextStyle(fontSize: 20, color: Colors.blue)),

            Icon(this.book.active == true?Icons.check_circle:Icons.close, color: this.book.active == true?Colors.blue:Colors.red,)
          ],
        ),
      ),
    );
  }
}