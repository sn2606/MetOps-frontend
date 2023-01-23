import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../screens/welcome.dart';
import '../utils/api.dart';
import '../utils/router.dart';

/// Service class that contains all authentication helper methods.
class AuthService {
  /// Session manager instace to handle sessions.
  // ignore: non_constant_identifier_names
  static final SESSION = SessionManager();

  /// Helper method for user login.
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final queryParameters = jsonEncode({
        'username': username,
        'password': password,
      });
      // login request to backend Rest API
      final uri = Uri.http(Endpoints.authority, Endpoints.login);
      http.Response response = await http.post(
        uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: queryParameters,
      );

      // If backend login successful and access/refresh tokens returned
      if (response.statusCode == 200) {
        final tokenMap = Map<String, dynamic>.from(jsonDecode(response.body));
        final tokens = Map<String, String>.from(tokenMap['token']);
        final accessToken = tokens['access'];
        final refreshToken = tokens['refresh'];
        setToken(accessToken!, refreshToken!);

        // GET account info of logged in user
        final accUri = Uri.http(Endpoints.authority, Endpoints.accountInfo);
        http.Response accInfoResponse = await http.get(
          accUri,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: "Bearer $accessToken"
          },
        );

        // If account info call successful
        if (accInfoResponse.statusCode == 200) {
          final accInfo =
              Map<String, dynamic>.from(jsonDecode(accInfoResponse.body));
          setAccInfo(accInfo['id']!, accInfo['username']!);
          SESSION.set('loggedIn', true);

          // Create user model of logged in user.
          // Defined in user.dart
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

  /// Helper method to set tokens in session using the session manager instance.
  static setToken(String accessToken, String refreshToken) async {
    _AuthData data =
        _AuthData(accessToken: accessToken, refreshToken: refreshToken);
    await SESSION.set('tokens', data);
  }

  /// Helper method to set userid and username of logged in user using the session manager instance.
  static setAccInfo(int id, String username) async {
    await SESSION.set('userid', id);
    await SESSION.set('username', username);
  }

  /// Helper method to get tokens from the session using the session manager instance.
  static Future<Map<String, dynamic>> getToken() async {
    return await SESSION.get('tokens');
  }

  /// Helper method to get userid and username of logged in user using the session manager instance.
  static Future<Map<String, dynamic>> getAccInfo() async {
    int userid = await SESSION.get('userid');
    String username = await SESSION.get('username');
    Map<String, dynamic> info = {
      'userid': userid,
      'username': username,
    };

    return info;
  }
}

/// Helper class for storing token information as a Map.
/// Required by Session manager.
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

/// Helper function to logout the user.
void logoutUser(BuildContext context) {
  SessionManager().destroy();
  Navigate.pushPage(context, const WelcomePage());
}
