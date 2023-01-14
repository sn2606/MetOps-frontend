import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/api.dart';

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
  late Future<Map<String, dynamic>> _data;
  late Map<String, dynamic> _test;

  Future<Map<String, dynamic>> _fetchQueryResult(
      double latitude, double longitude) async {
    final queryParameters = {
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
    };
    try {
      final uri =
          Uri.http(Endpoints.authority, Endpoints.askQuery, queryParameters);
      _response = await http.get(uri, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      if (_response.statusCode == 200) {
        _test = jsonDecode(_response.body);
        print(_test['data']);
        return jsonDecode(_response.body);
      } else {
        throw Exception('Bad Response');
      }
    } catch (error) {
      return jsonDecode("{}");
    }
  }

  @override
  void initState() {
    super.initState();
    _latitude = widget.latitude;
    _longitude = widget.longitude;
    _data = _fetchQueryResult(_latitude, _longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('boo'),
    );
  }
}
