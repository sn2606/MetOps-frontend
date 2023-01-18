import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../models/record.dart';
import '../../utils/api.dart';
import '../../utils/styles.dart';
import '../../utils/router.dart';
import '../../screens/main_screen.dart';
import '../action_btn_filled.dart';
import '../action_btn_outlined.dart';

class RecordTableBuilder extends StatefulWidget {
  final Future<List<RecordItem>?> futureRecordItems;
  final double latitude;
  final double longitude;
  final int queryid;

  const RecordTableBuilder({
    super.key,
    required this.futureRecordItems,
    required this.latitude,
    required this.longitude,
    required this.queryid,
  });

  @override
  State<RecordTableBuilder> createState() => _RecordTableBuilderState();
}

class _RecordTableBuilderState extends State<RecordTableBuilder> {
  Timer? _timer;

  void _delete(BuildContext context, VoidCallback ifOk) async {
    final session = SessionManager();
    final tokens = await session.get('tokens');
    final accessToken = tokens['accessToken'];

    EasyLoading.show(status: 'Deleting...');
    List<RecordItem>? records = await widget.futureRecordItems;
    final Map<String, dynamic> saveBody = {
      'userid': await session.get('userid'),
      'queryid': widget.queryid,
      'recordid': records!.map((rec) {
        return rec.id;
      }).toList()
    };

    // save the above constructed data
    final uri = Uri.http(Endpoints.authority, Endpoints.deleteRecord);
    http.Response response = await http.delete(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: "Bearer $accessToken"
      },
      body: jsonEncode(saveBody),
    );

    if (response.statusCode == 200) {
      EasyLoading.showSuccess('Deleted');
      EasyLoading.dismiss();
      ifOk();
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
          .futureRecordItems, // a previously-obtained Future<String> or null
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
                          child: Text('Wind Speed (km/h)'),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text('Wind Dir (° from N)'),
                        ),
                      ),
                    ],
                    rows: [
                      ...snapshot.data!.map((item) {
                        return DataRow(
                          cells: [
                            DataCell(Text(item.height.toString())),
                            DataCell(Text(
                                item.actualTemperature.toStringAsFixed(4))),
                            DataCell(Text(
                                item.virtualTemperature.toStringAsFixed(4))),
                            DataCell(Text(item.pressure.toStringAsFixed(4))),
                            DataCell(
                                Text(item.relativeHumidity.toStringAsFixed(4))),
                            DataCell(Text(item.windSpeed.toStringAsFixed(4))),
                            DataCell(
                                Text(item.windDirection.toStringAsFixed(4))),
                          ],
                        );
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
                    title: 'Export',
                    onPressed: () {},
                  ),
                  ActionButtonOutlined(
                    title: 'Delete',
                    onPressed: () {
                      _delete(
                        context,
                        () => Navigate.pushPage(
                          context,
                          const ScaffoldCustom(screenIndex: 2),
                        ),
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
