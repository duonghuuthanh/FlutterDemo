import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  String title;

  ItemWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Card(
          color: Colors.lightBlue,
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Row(
              spacing: 10,
              children: [
                CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.title,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Text(
                      "1 day ago",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
