import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../models/record.dart';
import '../utils/api.dart';
import '../widgets/query/table_builder.dart';

class QueryResult extends StatefulWidget {
  final double latitude;
  final double longitude;
  const QueryResult(
      {super.key, required this.latitude, required this.longitude});

  @override
  State<QueryResult> createState() => _QueryResultState();
}

class _QueryResultState extends State<QueryResult> {
  late double _latitude;
  late double _longitude;
  late http.Response _response;
  late Map<String, dynamic> _data;
  late Future<List<RecordItem>?> _futureRecordItems;

  Future<Map<String, dynamic>> _fetchQueryResult(
      double latitude, double longitude) async {
    final queryParameters = {
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
    };
    try {
      final tokens = await SessionManager().get('tokens');
      final accessToken = tokens['accessToken'];
      // final refreshToken = tokens['refreshToken'];
      final uri =
          Uri.http(Endpoints.authority, Endpoints.askQuery, queryParameters);
      _response = await http.get(uri, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $accessToken'
      });
      if (_response.statusCode == 200) {
        return jsonDecode(_response.body);
      } else {
        throw Exception('Bad Response');
      }
    } catch (error) {
      return jsonDecode('{"status": 400}');
    }
  }

  Future<List<RecordItem>?> processResult(
      double latitude, double longitude) async {
    _data = await _fetchQueryResult(latitude, longitude);
    if (_data['status'] == 200) {
      return _data['records']
          .map<RecordItem>((item) =>
              RecordItem.fromJsonTable(Map<String, dynamic>.from(item)))
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
    _futureRecordItems = processResult(_latitude, _longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TableBuilder(
        futureRecordItems: _futureRecordItems,
        latitude: _latitude,
        longitude: _longitude,
      ),
    );
  }
}
