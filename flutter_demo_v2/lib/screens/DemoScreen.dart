import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_v2/models/Book.dart';

class DemoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoState();
  }
}

class _DemoState extends State<DemoScreen> {
  List<Book> books = [];
  List<Book> filteredBooks = [];
  TextEditingController _controller = TextEditingController();
  bool isActive = false;
  final categories = {
    "basic": true,
    "program": true,
    "code": true
  };
  int page = 1;

  ScrollController _scrollController = ScrollController();

  Future<void> loadBooks() async{
    final res = await rootBundle.loadString("assets/data/books${page}.json");
    List<dynamic> data = json.decode(res);

    setState(() {
      final tmp = data.map((json) {
        return Book.fromJson(json);
      }).toList();

      for (var t in tmp)
        books.add(t);

      filter();
    });

  }

  @override
  void initState() {
    super.initState();
    this.loadBooks();

    this._controller.addListener(() {
      filter();
    });

    this._scrollController.addListener(() {
      if (this._scrollController.position.pixels
            == this._scrollController.position.maxScrollExtent) {
        page = page + 1;
        if (page <= 3) {
          loadBooks();
        }
      }

    });
  }

  void filter() {
    String txt = this._controller.text;

    setState(() {
      filteredBooks = books.where((b) {
        bool r = b.name.toLowerCase().contains(txt.toLowerCase());
        if (isActive == true)
          r = r && b.active==true;

        final selectedCates = categories.entries.where((c) => c.value == true)
                                .map((c) => c.key).toList();
        print(selectedCates);
        if (selectedCates.isNotEmpty)
          r = r && selectedCates.contains(b.category);

        return r;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                label: Text("Enter keyword..."),
                border: OutlineInputBorder()
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: categories.entries.map((e) {
                  return Row(
                    children: [
                      Checkbox(value: e.value, onChanged: (value) {
                          setState(() {
                            categories[e.key] = value!;
                          });
                          filter();
                      }),
                      Text(e.key)
                    ],
                  );
              }).toList(),
            ),

         
            SwitchListTile(
              title: Text("Only show active books!"),
                value: isActive, onChanged: (value) {
              setState(() {
                isActive = value;
              });
              filter();
            }),

            Expanded(child: books.isEmpty?Center(
              child: CircularProgressIndicator(),
            ):Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: filteredBooks.length,
                itemBuilder: (context, index) {
                  Book b = filteredBooks[index];

                  return Dismissible(
                    key: Key(b.id.toString()),
                    direction: DismissDirection.endToStart,
                    child: BookItem(book: b),
                    onDismissed: (direction) {
                      books.remove(b);
                      filter();
                    },
                  );
                },
              ),
            ))
          ],
        ),
      )
    );
  }
}

class BookItem extends StatelessWidget {
  final Book book;

  BookItem({required this.book});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsetsGeometry.all(10),
      child: Card(
        child: Padding(
            padding: EdgeInsetsGeometry.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Image.asset(
                    this.book.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill
                ),
              ),

              Column(
                children: [
                  Text(this.book.name, style: TextStyle(fontSize: 18, color: Colors.blue),),
                  Text("${this.book.price} VND", style: TextStyle(fontSize: 14, color: Colors.red),),
                ],
              ),

              Text(this.book.category, style: TextStyle(fontSize: 16, color: Colors.blue)),

              Icon(this.book.active == true ? Icons.check_circle:Icons.delete)
            ],
          ),
        ),
      ),
    );
  }
}