import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../../models/record.dart';
import '../../utils/api.dart';
import '../../utils/styles.dart';
import '../../utils/router.dart';
import '../../screens/main_screen.dart';
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

  void _save(BuildContext context, VoidCallback ifOk) async {
    final session = SessionManager();
    final tokens = await session.get('tokens');
    final accessToken = tokens['accessToken'];

    List<RecordItem>? records = await futureRecordItems;
    final Map<String, dynamic> saveBody = {
      'user': {
        'userid': await session.get('userid'),
      },
      'query': {
        'latitude': latitude,
        'longitude': longitude,
      },
      'records': records!.map((rec) {
        return {
          'height': rec.height,
          'temperature': double.parse(rec.actualTemperature.toStringAsFixed(4)),
          'virtual_temperature':
              double.parse(rec.virtualTemperature.toStringAsFixed(4)),
          'pressure': double.parse(rec.pressure.toStringAsFixed(4)),
          'relative_humidity':
              double.parse(rec.relativeHumidity.toStringAsFixed(4)),
          'wind_speed': double.parse(rec.windSpeed.toStringAsFixed(4)),
          'wind_direction': double.parse(rec.windDirection.toStringAsFixed(4)),
        };
      }).toList()
    };

    // save the above constructed data
    final uri = Uri.http(Endpoints.authority, Endpoints.saveQuery);
    http.Response response = await http.post(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: "Bearer $accessToken"
      },
      body: jsonEncode(saveBody),
    );

    if (response.statusCode == 200) {
      ifOk();
    } else {
      // show error - state management
    }
  }

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
                    onPressed: () => _save(context, () {
                      Navigate.pushPage(
                        context,
                        const ScaffoldCustom(screenIndex: 2),
                      );
                    }),
                  ),
                  ActionButtonOutlined(
                    title: 'Cancel',
                    onPressed: () {
                      Navigate.pushPage(
                        context,
                        const ScaffoldCustom(screenIndex: 1),
                      );
                    },
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
