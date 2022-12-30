import 'package:flutter/material.dart';

import '../widgets/scaffold/app_bar.dart';
import '../widgets/scaffold/bottom_bar.dart';
import '../widgets/scaffold/drawer.dart';
import './dashboard.dart';
import './query.dart';
import './records.dart';

class ScaffoldCustom extends StatefulWidget {
  const ScaffoldCustom({super.key});

  @override
  State<ScaffoldCustom> createState() => _ScaffoldCustomState();
}

class _ScaffoldCustomState extends State<ScaffoldCustom> {
  List<Widget?> _screens = [Query(), Dashboard(), Records()];
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
