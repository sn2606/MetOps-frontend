import 'package:flutter/material.dart';

class QueryResult extends StatefulWidget {
  final latitude;
  final longitude;
  const QueryResult(
      {super.key, required this.latitude, required this.longitude});

  @override
  State<QueryResult> createState() => _QueryResultState();
}

class _QueryResultState extends State<QueryResult> {
  late double _latitude;
  late double _longitude;

  @override
  void initState() {
    super.initState();
    _latitude = widget.latitude;
    _longitude = widget.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('($_latitude, $_longitude)'),
    );
  }
}
