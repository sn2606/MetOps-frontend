import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../utils/styles.dart';
import '../utils/api.dart';
import '../widgets/records/record_card.dart';
import '../models/query_model.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  late http.Response _response;
  late List<dynamic> _data;
  late Future<List<QueryModel>?> _futureQueryList;

  Future<http.Response> _fetchQueryResult() async {
    try {
      final tokens = await SessionManager().get('tokens');
      final accessToken = tokens['accessToken'];
      final userid = await SessionManager().get('userid');
      final queryParameters = {
        'userid': userid.toString(),
      };
      // final refreshToken = tokens['refreshToken'];
      final uri =
          Uri.http(Endpoints.authority, Endpoints.queryList, queryParameters);
      _response = await http.get(uri, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $accessToken'
      });
      return _response;
    } catch (error) {
      return http.Response(error.toString(), 400);
    }
  }

  Future<List<QueryModel>?> processResult() async {
    _response = await _fetchQueryResult();
    if (_response.statusCode == 200) {
      _data = jsonDecode(_response.body);
      return _data
          .map<QueryModel>(
              (item) => QueryModel.fromJson(Map<String, dynamic>.from(item)))
          .toList();
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _futureQueryList = processResult();
  }

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
          SizedBox(
            height: 550,
            child: FutureBuilder<List<QueryModel>?>(
              future: _futureQueryList,
              builder: (context, snapshot) {
                Widget returnWidget = const SizedBox();
                if (snapshot.hasData) {
                  final queryList = snapshot.data;
                  if (queryList == null) {
                    returnWidget = const SizedBox(
                      child: Text("No records yet!"),
                    );
                  } else {
                    if (queryList.isEmpty) {
                      returnWidget = const SizedBox(
                        child: Text("No records yet!"),
                      );
                    } else {
                      returnWidget = ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return RecordCard(
                            queryList: queryList,
                            index: index,
                          );
                        },
                        itemCount: queryList.length,
                      );
                    }
                  }
                } else if (snapshot.hasError) {
                  returnWidget = const Text(
                    'Sorry, there has been an error on our side!',
                  );
                } else {
                  returnWidget = const Center(
                    child: CircularProgressIndicator(
                      color: ColorSelection.primary,
                    ),
                  );
                }
                return returnWidget;
              },
            ),
          ),
        ],
      ),
    );
  }
}
