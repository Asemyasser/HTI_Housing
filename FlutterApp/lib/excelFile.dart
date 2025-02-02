import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// this woooooorkkkk
class Excel extends StatefulWidget {
  static const String routeName = '/Excel';

  @override
  State<Excel> createState() => _Excel();
}

class _Excel extends State<Excel> {
  List<List<dynamic>> _data = [];

  void loadCSV() async {
    final rawData = await rootBundle.loadString("assets/file/Attendance.csv");
    List<List<dynamic>> _listData = const CsvToListConverter().convert(rawData);
    setState(() {
      _data = _listData;
    });
  }

  @override
  void initState() {
    super.initState();
    loadCSV(); // Call loadCSV when the widget is created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Excel Read")),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (_, index) {
          var row = _data[index];

          if (row.length >= 3) {
            return Card(
              child: ListTile(
                leading: Text(row[0].toString()),
                title: Text(row[1].toString()),
                trailing: Text(row[2].toString()),
              ),
            );
          } else {
            // Handle rows with fewer than 3 elements
            return Card(
              child: ListTile(
                leading: Text(row[0].toString()),
                title: Text(row.length > 1 ? row[1].toString() : 'No Data'),
                trailing: Text(row.length > 2 ? row[2].toString() : 'No Data'),
              ),
            );
          }
        },
      ),
    );
  }
}
