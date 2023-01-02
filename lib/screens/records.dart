import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:metops/utils/colors.dart';

import '../models/record.dart';
import '../widgets/title_text.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  List<Record> _recordList = [
    Record(
      id: 'r1',
      location: 'location',
      latitude: 18.673,
      longitude: -65.899,
      actualTemperature: [],
      humidity: [],
      pressure: [],
      virtualTemperature: [],
      windDirection: [],
      windSpeed: [],
      created: DateTime.now(),
    ),
    Record(
      id: 'r2',
      location: 'location',
      latitude: 56.119,
      longitude: -14.296,
      actualTemperature: [],
      humidity: [],
      pressure: [],
      virtualTemperature: [],
      windDirection: [],
      windSpeed: [],
      created: DateTime.now(),
    ),
    Record(
      id: 'r1',
      location: 'location',
      latitude: 21.534,
      longitude: -45.001,
      actualTemperature: [],
      humidity: [],
      pressure: [],
      virtualTemperature: [],
      windDirection: [],
      windSpeed: [],
      created: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(title: 'Records'),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                ..._recordList.map((rec) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      side: BorderSide(color: primary),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: neutralContainer,
                          border: Border(
                            left: BorderSide(
                              color: primary,
                              width: 5,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: primary,
                                  size: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${rec.latitude}, ${rec.longitude}',
                                      style: TextStyle(
                                        color: primary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '${rec.location}',
                                      style: TextStyle(
                                        color: primary,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  DateFormat('dd-MM-yy').format(rec.created),
                                  style: TextStyle(
                                    color: primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  DateFormat.jm().format(rec.created),
                                  style: TextStyle(
                                    color: primary,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
