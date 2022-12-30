import 'package:flutter/material.dart';

import 'package:metops/widgets/app_bar.dart';
import 'package:metops/widgets/bottom_bar.dart';
import 'package:metops/widgets/drawer.dart';

class ScaffoldCustom extends StatefulWidget {
  const ScaffoldCustom({super.key});

  @override
  State<ScaffoldCustom> createState() => _ScaffoldCustomState();
}

class _ScaffoldCustomState extends State<ScaffoldCustom> {
  final List<Widget?> _screens = [
    Text("Query"),
    Text("Dashboard"),
    Text("Records")
  ];
  var _screenIndex = 0;

  void _bindScreens(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      drawer: DrawerCustom(),
      body: _screens[_screenIndex],
      bottomNavigationBar: BottomBar(
        screenIndex: _screenIndex,
        bindScreens: _bindScreens,
        screens: _screens,
      ),
    );
  }
}
