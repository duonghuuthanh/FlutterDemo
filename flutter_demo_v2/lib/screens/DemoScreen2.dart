import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_v2/models/Book.dart';

class DemoScreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoState();
  }
}

class _DemoState extends State<DemoScreen2> {
  List<Book> books = [];
  List<Book> filteredBooks = [];
  TextEditingController _controller = TextEditingController();
  bool isActive = false;
  ScrollController _scrollController = ScrollController();

  final categories = {
    "code": true,
    "basic": true,
    "technique": true
  };
  int page = 1;

  Future<void> loadBooks() async{
    final res = await rootBundle.loadString("assets/data/books${page}.json");
    List<dynamic> data = json.decode(res);

    setState(() {
      List<Book> t = data.map((json) {
        return Book.fromJson(json);
      }).toList();
      books.addAll(t);
      filteredBooks = books;
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

        final selectedCates = categories.entries.where((c) => c.value==true)
                                        .map((c) => c.key).toList();
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
                    border: UnderlineInputBorder()
                ),
              ),

              SwitchListTile(
                  title: Text("Only show active books!"),
                  value: isActive, onChanged: (value) {
                setState(() {
                  isActive = value;
                });
                filter();
              }),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: categories.entries.map((c) {
                  return Row(
                    children: [
                      Checkbox(value: c.value, onChanged: (value) {
                        setState(() {
                          categories[c.key] = value!;
                        });
                        filter();
                      }),
                      Text(c.key)
                    ],
                  );

                }).toList(),
              ),

              Expanded(child: books.isEmpty?Center(
                child: CircularProgressIndicator(),
              ):Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: ListView.builder(
                  controller: this._scrollController,
                  itemCount: filteredBooks.length,
                  itemBuilder: (context, index) {
                    Book b = filteredBooks[index];

                    return Dismissible(
                        key: Key(b.id.toString()),
                        child: BookItem(book: b),
                        direction: DismissDirection.endToStart,

                        onDismissed: (direction) {
                            books.remove(b);
                            filter();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Deleted ${b.name}!"),
                                duration: Duration(seconds: 2),)
                            );
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