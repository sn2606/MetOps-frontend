import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../models/record.dart';
import '../utils/api.dart';
import '../widgets/records/record_builder.dart';

class RecordResult extends StatefulWidget {
  final int queryid;
  final double latitude;
  final double longitude;
  const RecordResult({
    super.key,
    required this.queryid,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<RecordResult> createState() => _RecordResultState();
}

class _RecordResultState extends State<RecordResult> {
  late int _queryid;
  late double _latitude;
  late double _longitude;
  late http.Response _response;
  late List<dynamic> _data;
  late Future<List<RecordItem>?> _futureRecordItems;

  Future<http.Response> _fetchRecordResult(
      double latitude, double longitude, int queryid) async {
    final queryParameters = {
      'queryid': queryid.toString(),
    };
    try {
      final tokens = await SessionManager().get('tokens');
      final accessToken = tokens['accessToken'];
      // final refreshToken = tokens['refreshToken'];
      final uri = Uri.http(
          Endpoints.authority, Endpoints.recordDetail, queryParameters);
      _response = await http.get(uri, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $accessToken'
      });
      return _response;
    } catch (error) {
      return http.Response(error.toString(), 400);
    }
  }

  Future<List<RecordItem>?> processResult(
      double latitude, double longitude, int queryid) async {
    _response = await _fetchRecordResult(latitude, longitude, queryid);
    if (_response.statusCode == 200) {
      _data = jsonDecode(_response.body);
      return _data
          .map<RecordItem>((item) =>
              RecordItem.fromJsonDetail(Map<String, dynamic>.from(item)))
          .toList();
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _latitude = widget.latitude;
    _longitude = widget.longitude;
    _queryid = widget.queryid;
    _futureRecordItems = processResult(_latitude, _longitude, _queryid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RecordTableBuilder(
        futureRecordItems: _futureRecordItems,
        latitude: _latitude,
        longitude: _longitude,
      ),
    );
  }
}
