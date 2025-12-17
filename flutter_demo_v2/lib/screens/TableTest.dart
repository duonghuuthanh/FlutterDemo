import 'package:flutter/material.dart';

class SortableTable extends StatefulWidget {
  @override
  _SortableTableState createState() => _SortableTableState();
}

class _SortableTableState extends State<SortableTable> {
  List<Map<String, dynamic>> users = [
    {"id": 1, "name": "Alice"},
    {"id": 2, "name": "Bob"},
    {"id": 3, "name": "Charlie"},
  ];
  bool _sortAsc = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sortable DataTable")),
      body: SingleChildScrollView(
        child: DataTable(
          sortAscending: _sortAsc,
          sortColumnIndex: 0,
          columns: [
            DataColumn(
              label: Text("ID"),
              onSort: (columnIndex, _) {
                setState(() {
                  _sortAsc = !_sortAsc;
                  users.sort((a, b) => _sortAsc
                      ? a["id"].compareTo(b["id"])
                      : b["id"].compareTo(a["id"]));
                });
              },
            ),
            DataColumn(label: Text("Name")),
          ],
          rows: users
              .map(
                (user) => DataRow(cells: [
              DataCell(Text(user["id"].toString())),
              DataCell(Text(user["name"])),
            ]),
          )
              .toList(),
        ),
      ),
    );
  }
}