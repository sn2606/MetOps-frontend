import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../models/record.dart';
import '../utils/api.dart';
import '../widgets/records/record_builder.dart';

/// Record Result screen of the app.
/// Visible when user taps on a record on the Record screen.
class RecordResult extends StatefulWidget {
  final int queryid;
  final double latitude;
  final double longitude;

  /// Constructor Record Result screen of the app.
  /// Renders saved RecordItems in tabular format
  /// when user taps on a record on the Record screen.
  /// Requires: Query ID of the saved query that corresponds to the saved records.
  /// Latitude and Longitude of location
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

  /// Response of retrieve Record items request.
  late http.Response _response;

  /// Holds the body of response of retrieve Record items Request (list of JSON format).
  late List<dynamic> _data;

  /// List of record items obtained after processing response.
  late Future<List<RecordItem>?> _futureRecordItems;

  /// Method to get retrieve saved Record items corresponding to a saved Query.
  /// GET request made to backend Rest API.
  /// Backend Rest API retrives saved items from database.
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
      return await http.get(uri, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $accessToken'
      });
    } catch (error) {
      return http.Response(error.toString(), 400);
    }
  }

  /// Method to process result of retrieve Record items request.
  /// RecordItem model instances (defined in record.dart) are created from JSON response body.
  Future<List<RecordItem>?> processResult(
      double latitude, double longitude, int queryid) async {
    _response = await _fetchRecordResult(latitude, longitude, queryid);
    // If there is no error and everything goes over perfectly
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
        queryid: _queryid,
      ),
    );
  }
}
