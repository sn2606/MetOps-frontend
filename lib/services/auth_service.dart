import 'dart:io';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../utils/api.dart';

class AuthService {
  // ignore: non_constant_identifier_names
  static final SESSION = SessionManager();

  Future<dynamic> login(String username, String password) async {
    try {
      final queryParameters = {'username': username, 'password': password};
      final uri =
          Uri.http(Endpoints.authority, Endpoints.login, queryParameters);
      http.Response response = await http.post(
        uri,
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      print('boo');

      print(response.body);

      return response.body;
    } finally {
      // you can do somethig here
    }
  }

  static setToken(String accessToken, String refreshToken) async {
    _AuthData data =
        _AuthData(accessToken: accessToken, refreshToken: refreshToken);
    await SESSION.set('tokens', data);
  }

  static Future<Map<String, dynamic>> getToken() async {
    return await SESSION.get('tokens');
  }

  static removeToken() async {
    await SESSION.destroy();
  }
}

class _AuthData {
  String accessToken, refreshToken;
  _AuthData({required this.accessToken, required this.refreshToken});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'accessToken': accessToken,
      'refreshToken': refreshToken
    };
    return data;
  }
}
