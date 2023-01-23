import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../models/record.dart';
import '../utils/api.dart';
import '../widgets/query/table_builder.dart';

/// Query Result screen of the app.
/// Displays result of query asked in tabular format.
/// User can save the result.
class QueryResult extends StatefulWidget {
  final double latitude;
  final double longitude;

  /// Constructor for Stateful Widget to display result (not saved) of query asked by the User.
  /// Needs input of latitude and longitude of location.
  const QueryResult(
      {super.key, required this.latitude, required this.longitude});

  @override
  State<QueryResult> createState() => _QueryResultState();
}

class _QueryResultState extends State<QueryResult> {
  late double _latitude;
  late double _longitude;

  /// Response of Query request.
  late http.Response _response;

  /// Holds the body of response of Query Request (JSON format).
  late Map<String, dynamic> _data;

  /// List of record items obtained after processing response.
  late Future<List<RecordItem>?> _futureRecordItems;

  /// Method to get result of query.
  /// GET request made to backend Rest API.
  /// Backend Rest API calls Meteomatics API.
  Future<http.Response> _fetchQueryResult(
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
      return await http.get(uri, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $accessToken'
      });
    } catch (error) {
      return http.Response(error.toString(), 400);
    }
  }

  /// Method to process result of Query request.
  /// RecordItem model instances (defined in record.dart) are created from JSON response body.
  Future<List<RecordItem>?> processResult(
      double latitude, double longitude) async {
    _response = await _fetchQueryResult(latitude, longitude);
    // If there is no error and everything goes over perfectly
    if (_response.statusCode == 200) {
      _data = jsonDecode(_response.body);
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
