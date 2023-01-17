import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import './screens/welcome.dart';
import './screens/main_screen.dart';
import './utils/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isActive = await SessionManager().get('loggedIn');
  bool loggedIn = (isActive == null ? false : true);
  runApp(MyApp(
    loggedIn: loggedIn,
  ));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 30.0
    ..radius = 5.0
    ..progressColor = ColorSelection.primary
    ..backgroundColor = Colors.transparent
    ..indicatorColor = ColorSelection.primary
    ..textColor = ColorSelection.primary
    ..textStyle = TextStyleSelection.primaryText
    ..boxShadow = [const BoxShadow(color: ColorSelection.neutral)]
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  final bool loggedIn;
  const MyApp({super.key, required this.loggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: ColorSelection.neutral,
        fontFamily: 'Montserrat',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorSelection.neutral,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: ColorSelection.neutral,
          elevation: 0,
          iconTheme: IconThemeData(
            color: ColorSelection.primary,
            size: 30,
          ),
        ),
      ),
      home:
          loggedIn ? const ScaffoldCustom(screenIndex: 0) : const WelcomePage(),
      builder: EasyLoading.init(),
    );
  }
}
