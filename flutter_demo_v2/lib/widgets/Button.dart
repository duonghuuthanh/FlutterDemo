import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [

          Row(
            spacing: 8,
            children: [
              Text("ElevatedButton: "),
              ElevatedButton(
                onPressed: () {},
                child: Text("Elevated"),
              )
            ],
          ),

          Row(
            spacing: 8,
            children: [
              Text("OutlinedButton: "),
              OutlinedButton(
                onPressed: () {},
                child: Text("Outlined"),
              )
            ],
          ),

          Row(
            spacing: 8,
            children: [
              Text("TextButton: "),
              TextButton(
                onPressed: () {},
                child: Text("Text Button"),
              )
            ],
          ),

          Row(
            spacing: 8,
            children: [
              Text("IconButton: "),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
              ),
            ],
          ),

          Row(
            spacing: 8,
            children: [
              Text("PopupMenuButton: "),
              PopupMenuButton<String>(
                onSelected: (value) => print(value),
                itemBuilder: (_) => [
                  PopupMenuItem(value: "copy", child: Text("Copy")),
                  PopupMenuItem(value: "paste", child: Text("Paste")),
                ],
              )
            ],
          ),

          Row(
            spacing: 8,
            children: [
              Text("DropdownButton: "),
              DropdownButton<String>(
                value: "One",
                items: ["One", "Two", "Three"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (value) {

                },
              )

            ],
          )
        ],
      ),
    );
  }
}