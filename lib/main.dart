import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/welcome.dart';
import './utils/styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const WelcomePage(),
    );
  }
}
