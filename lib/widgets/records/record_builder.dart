import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:csv/csv.dart';
import 'package:external_path/external_path.dart';
import 'package:cr_file_saver/file_saver.dart';

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

  void _export(List<RecordItem> data, VoidCallback ifOk) async {
    bool granted = await CRFileSaver.requestWriteExternalStoragePermission();
    if (granted) {
      List<List<dynamic>> csvData = [];
      List<dynamic> header = [];
      header.add('ID');
      header.add('Height');
      header.add('Actual Temperature');
      header.add('Virtual Temperature');
      header.add('Pressure');
      header.add('Relative Humidity');
      header.add('Wind Speed');
      header.add('Wind Direction');
      csvData.add(header);

      for (var i = 0; i < data.length; i++) {
        List<dynamic> row = [];
        row.add(data[i].id! - 1);
        row.add(data[i].height);
        row.add(data[i].actualTemperature);
        row.add(data[i].virtualTemperature);
        row.add(data[i].pressure);
        row.add(data[i].relativeHumidity);
        row.add(data[i].windSpeed);
        row.add(data[i].windDirection);
        csvData.add(row);
      }

      var csv = const ListToCsvConverter().convert(csvData);
      var path = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOADS);
      var file = path;

      File f = File('$file/${widget.latitude},${widget.longitude}.csv');

      f.writeAsString(csv);
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
          if (snapshot.data == null) {
            children = <Widget>[
              const Text('Sorry, there is no data to show!'),
            ];
          } else {
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
                              DataCell(Text(
                                  item.relativeHumidity.toStringAsFixed(4))),
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
                      onPressed: () {
                        _export(
                          snapshot.data!,
                          () => Navigate.pushPage(
                            context,
                            const ScaffoldCustom(screenIndex: 2),
                          ),
                        );
                      },
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
          }
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
