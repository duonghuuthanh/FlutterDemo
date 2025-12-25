import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  Map<String, double> expenseByCategory = {
    'Food': 120,
    'Transport': 80,
    'Shopping': 150,
    'Other': 50,
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Category Screen"),
        ),
        body: Center(
          child: PieChart(
            PieChartData(
              sections: expenseByCategory.entries.map((e) {
                return PieChartSectionData(
                  value: e.value,
                  title: '${e.key}\n${e.value}',
                  radius: 60,
                  color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1)
                );
              }).toList(),
            ),
          ),
        )
    );
  }
}