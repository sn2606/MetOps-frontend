import 'package:flutter/material.dart';
import 'package:metops/utils/styles.dart';
import 'package:metops/widgets/records/record_card.dart';

import '../models/record.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  final List<Record> _recordList = [
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
      margin: const EdgeInsets.only(left: 25, right: 25, top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Records',
            style: TextStyleSelection.titleTextHome,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return RecordCard(recordsList: _recordList, index: index);
              },
              itemCount: _recordList.length,
            ),
          ),
        ],
      ),
    );
  }
}
