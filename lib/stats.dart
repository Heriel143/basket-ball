import 'dart:convert';
// import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'models/stat.dart';
// import 'package:go_router/go_router.dart';

class Stats extends StatefulWidget {
  /// Constructs a [Stats] widget.
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

List<Stat> _stats = [];

class _StatsState extends State<Stats> {
  Future<List<Stat>> fetchStats() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/stats'));

    if (response.statusCode == 200) {
      var one = json.decode(response.body);
      List<dynamic> data = one['data'];
      // print(data);
      _stats = data.map((json) => Stat.fromJson(json)).toList();

      // print(_stats[0].team.name);
      return _stats;
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stats', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future: fetchStats(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final DataTableSource data = MyData();
              // print(snapshot.data!.length);
              return Column(
                children: [
                  PaginatedDataTable(
                    source: data,
                    columns: const [
                      DataColumn(label: Text('#')),
                      // DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Team')),
                      DataColumn(label: Text('Ast')),
                      DataColumn(label: Text('BLK')),
                      DataColumn(label: Text('TOV')),
                      DataColumn(label: Text('DREB')),
                      DataColumn(label: Text('FTA')),
                      DataColumn(label: Text('MIN')),
                    ],
                    header: const Center(
                      child: Text('Team stats'),
                    ),
                    columnSpacing: 30,
                    horizontalMargin: 25,
                    rowsPerPage: 10,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

class MyData extends DataTableSource {
  // final List<Map<String, dynamic>> _data = List.generate(
  //     20,
  //     (index) => {
  //           'id': index,
  //           "title": "Item $index",
  //           "pri": Random().nextInt(100),
  //           "pri2": Random().nextInt(100)
  //         });

  @override
  DataRow? getRow(int index) {
    var data = _stats[index];
    return DataRow(cells: [
      DataCell(Text(data.id.toString())),
      // DataCell(Text(data.player.firstName)),
      DataCell(Text(data.team.name)),
      DataCell(Text(data.ast.toString() == 'null' ? '0' : data.ast.toString())),
      DataCell(Text(data.blk.toString() == 'null' ? '0' : data.blk.toString())),
      DataCell(Text(
          data.turnover.toString() == 'null' ? '0' : data.turnover.toString())),
      DataCell(
          Text(data.dreb.toString() == 'null' ? '0' : data.dreb.toString())),
      DataCell(Text(data.fta.toString() == 'null' ? '0' : data.fta.toString())),
      DataCell(Text(data.min.toString() == 'null' ? '0' : data.min.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _stats.length;

  @override
  int get selectedRowCount => 0;
}
