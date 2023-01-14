import 'package:flutter/material.dart';

import '../../models/record.dart';
import '../../utils/styles.dart';
import '../action_btn_filled.dart';
import '../action_btn_outlined.dart';

class TableBuilder extends StatelessWidget {
  final Future<List<RecordItem>?> futureRecordItems;
  final double latitude;
  final double longitude;
  const TableBuilder({
    super.key,
    required this.futureRecordItems,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecordItem>?>(
      future: futureRecordItems, // a previously-obtained Future<String> or null
      builder: (context, snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Text(
              '$latitude, $longitude',
              style: TextStyleSelection.titleTextHome,
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataTextStyle: TextStyleSelection.primaryText,
                    columns: const [
                      DataColumn(
                        label: Expanded(
                          child: Text('Height'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Actual Temp.'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Virtual Temp.'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Pressure'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Humidity'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Wind Speed'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Wind Direction'),
                        ),
                      ),
                    ],
                    rows: [
                      ...snapshot.data!.map((item) {
                        return DataRow(cells: [
                          DataCell(Text(item.height.toString())),
                          DataCell(
                              Text(item.actualTemperature.toStringAsFixed(4))),
                          DataCell(
                              Text(item.virtualTemperature.toStringAsFixed(4))),
                          DataCell(Text(item.pressure.toStringAsFixed(4))),
                          DataCell(
                              Text(item.relativeHumidity.toStringAsFixed(4))),
                          DataCell(Text(item.windSpeed.toStringAsFixed(4))),
                          DataCell(Text(item.windDirection.toStringAsFixed(4))),
                        ]);
                      }).toList()
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionButtonFilled(
                    title: 'Save',
                    onPressed: () {},
                  ),
                  ActionButtonOutlined(
                    title: 'Cancel',
                    onPressed: () {},
                  )
                ],
              ),
            )
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Text('Sorry, there has been an error on our side!'),
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            ),
          ];
        }
        return Center(
          child: Container(
            margin:
                const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        );
      },
    );
  }
}
