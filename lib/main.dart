import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:metops/screens/main_screen.dart';
import 'package:metops/utils/colors.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: neutral,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
  // SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.manual,
  //   overlays: [SystemUiOverlay.top],
  // ).then(
  //   (_) => runApp(const MyApp()),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: neutral,
        fontFamily: 'Montserrat',
      ),
      home: ScaffoldCustom(),
    );
  }
}
