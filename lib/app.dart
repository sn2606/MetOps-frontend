import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import './screens/main_screen.dart';
import './screens/welcome.dart';
import './utils/styles.dart';

/// Configuration for flutter_easyloading display
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

/// Render MetOps application
class MetApp extends StatelessWidget {
  final bool loggedIn;

  /// Constructor to render MetOps application
  const MetApp({super.key, required this.loggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: ColorSelection.neutral,
        fontFamily: 'Montserrat', // filed in assets folder
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
