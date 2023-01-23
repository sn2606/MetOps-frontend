import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import './app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // check if there is a user already logged in
  final isActive = await SessionManager().get('loggedIn');
  bool loggedIn = (isActive == null ? false : true);
  runApp(MetApp(
    loggedIn: loggedIn,
  ));
  //flutter_easyloading configuration
  configLoading();
}
