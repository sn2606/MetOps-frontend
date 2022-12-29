import 'package:flutter/material.dart';

import 'package:metops/screens/scaffold_custom.dart';
import 'package:metops/utils/colors.dart';

void main() {
  runApp(const MyApp());
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
