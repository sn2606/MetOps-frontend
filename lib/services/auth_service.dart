import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:metops/utils/router.dart';

import '../utils/api.dart';
import '../models/user.dart';
import '../screens/welcome.dart';

class AuthService {
  // ignore: non_constant_identifier_names
  static final SESSION = SessionManager();

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final queryParameters = jsonEncode({
        'username': username,
        'password': password,
      });
      final uri = Uri.http(Endpoints.authority, Endpoints.login);
      http.Response response = await http.post(
        uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: queryParameters,
      );

      if (response.statusCode == 200) {
        final tokenMap = Map<String, dynamic>.from(jsonDecode(response.body));
        final tokens = Map<String, String>.from(tokenMap['token']);
        final accessToken = tokens['access'];
        final refreshToken = tokens['refresh'];
        setToken(accessToken!, refreshToken!);

        // get account info of logged in user
        final accUri = Uri.http(Endpoints.authority, Endpoints.accountInfo);
        http.Response accInfoResponse = await http.get(
          accUri,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: "Bearer $accessToken"
          },
        );

        if (accInfoResponse.statusCode == 200) {
          final accInfo =
              Map<String, dynamic>.from(jsonDecode(accInfoResponse.body));
          setAccInfo(accInfo['id']!, accInfo['username']!);
          SESSION.set('loggedIn', true);

          User loggedIn = User(
            id: accInfo['id'],
            username: accInfo['username'],
            fullName: accInfo['full_name'],
            email: accInfo['email'],
            phoneNo: accInfo['phone_no'],
            accessToken: accessToken,
            refreshToken: refreshToken,
          );

          return {
            'status': 200,
            'user': loggedIn,
          };
        } else {
          throw Exception(response.statusCode);
        }
      } else {
        throw Exception(response.statusCode);
      }
    } catch (error) {
      return {
        'status': 400,
        'error': error,
      };
    }
  }

  static setToken(String accessToken, String refreshToken) async {
    _AuthData data =
        _AuthData(accessToken: accessToken, refreshToken: refreshToken);
    await SESSION.set('tokens', data);
  }

  static setAccInfo(int id, String username) async {
    await SESSION.set('userid', id);
    await SESSION.set('username', username);
  }

  static Future<Map<String, dynamic>> getToken() async {
    return await SESSION.get('tokens');
  }

  static Future<Map<String, dynamic>> getAccInfo() async {
    int userid = await SESSION.get('userid');
    String username = await SESSION.get('username');
    Map<String, dynamic> info = {
      'userid': userid,
      'username': username,
    };

    return info;
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

void logoutUser(BuildContext context) {
  SessionManager().destroy();
  Navigate.pushPage(context, const WelcomePage());
}
