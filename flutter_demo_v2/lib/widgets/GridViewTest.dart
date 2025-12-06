import 'dart:math';

import 'package:flutter/material.dart';

class GridViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Random r = Random();
    return GridView.count(
      crossAxisCount: 3,
      children: [
        Container(
          height: 100,
          color: Color.fromARGB(255, r.nextInt(256), r.nextInt(256), r.nextInt(256)),

        ),
        Container(
          height: 100,
          color: Color.fromARGB(255, r.nextInt(256), r.nextInt(256), r.nextInt(256)),
        ),
        Container(
          height: 100,
          color: Color.fromARGB(255, r.nextInt(256), r.nextInt(256), r.nextInt(256)),
        ),
        Container(
          height: 100,
          color: Color.fromARGB(255, r.nextInt(256), r.nextInt(256), r.nextInt(256)),
        ),
        Container(
          height: 100,
          color: Color.fromARGB(255, r.nextInt(256), r.nextInt(256), r.nextInt(256)),
        ),
        Container(
          height: 100,
          color: Color.fromARGB(255, r.nextInt(256), r.nextInt(256), r.nextInt(256)),
        )
        ,
        Container(
          height: 100,
          color: Color.fromARGB(255, r.nextInt(256), r.nextInt(256), r.nextInt(256)),
        ),
        Container(
          height: 100,
          color: Color.fromARGB(255, r.nextInt(256), r.nextInt(256), r.nextInt(256)),
        )
      ],
    );
  }
}