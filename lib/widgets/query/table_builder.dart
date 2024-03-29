import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../action_btn_filled.dart';
import '../action_btn_outlined.dart';
import '../../models/record.dart';
import '../../screens/main_screen.dart';
import '../../utils/api.dart';
import '../../utils/router.dart';
import '../../utils/styles.dart';

/// Widget that renders a list of record items in a tabular format.
/// Used in query_result.dart
class TableBuilder extends StatefulWidget {
  /// Future instance that contains the list of record items to be rendered.
  final Future<List<RecordItem>?> futureRecordItems;
  final double latitude;
  final double longitude;

  /// Constructor of widget that renders a list of record items in a tabular format.
  /// Used to display fetched result of a query request.
  const TableBuilder({
    super.key,
    required this.futureRecordItems,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<TableBuilder> createState() => _TableBuilderState();
}

class _TableBuilderState extends State<TableBuilder> {
  /// Timer for easy_loading package usage
  Timer? _timer;

  /// Saves list of record items into the database.
  /// Method is called when save button is clicked.
  void _save(BuildContext context, VoidCallback ifOk) async {
    final session = SessionManager();
    final tokens = await session.get('tokens');
    final accessToken = tokens['accessToken'];

    EasyLoading.show(status: 'Saving...');

    // Construct data to be saved.
    List<RecordItem>? records = await widget.futureRecordItems;
    final Map<String, dynamic> saveBody = {
      'user': {
        'userid': await session.get('userid'),
      },
      'query': {
        'latitude': widget.latitude,
        'longitude': widget.longitude,
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

    // If saved successfully
    if (response.statusCode == 200) {
      EasyLoading.showSuccess('Saved');
      EasyLoading.dismiss();
      ifOk(); // Navigate to records page.
    } else {
      EasyLoading.showError('An error occured');
    }
  }

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    // EasyLoading.removeCallbacks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecordItem>?>(
      future: widget
          .futureRecordItems, // a previously-obtained Future<List<RecordItem>> or null
      builder: (context, snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Text(
              '${widget.latitude}, ${widget.longitude}',
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
                      // Table header
                      DataColumn(
                        label: Expanded(
                          child: Text('Height (m)'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Actual Temp. (°C)'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Virtual Temp. (°C)'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Pressure (hPa)'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Humidity (%)'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Wind Speed (kmh)'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Wind Dir (° from N)'),
                        ),
                      ),
                    ],
                    // Table content
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
                  // Save button
                  ActionButtonFilled(
                    title: 'Save',
                    onPressed: () => _save(context, () {
                      Navigate.pushPage(
                        context,
                        const ScaffoldCustom(screenIndex: 2),
                      );
                    }),
                  ),
                  // Cancel Button
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
          // While it is loading.
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                color: ColorSelection.primary,
              ),
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
