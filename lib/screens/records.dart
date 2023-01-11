import 'package:flutter/material.dart';

import '../utils/styles.dart';
import '../widgets/records/record_card.dart';
import '../models/record.dart';
import '../models/query_model.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  final List<Record> _recordList = [];
  final List<QueryModel> _queryList = [];

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
                return RecordCard(queryList: _queryList, index: index);
              },
              itemCount: _recordList.length,
            ),
          ),
        ],
      ),
    );
  }
}
