import 'package:flutter/material.dart';

import '../utils/styles.dart';
import '../widgets/scaffold/app_bar.dart';
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
  List<Widget?> _screens = [Dashboard(), Query(), Records()];
  var _screenIndex = 0;

  void _bindScreens(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _radius = kBottomNavigationBarHeight / 2;

    return Scaffold(
      appBar: AppBarCustom(),
      drawer: DrawerCustom(),
      body: _screens[_screenIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(_radius)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _screenIndex, //state management
            onTap: _bindScreens,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: ColorSelection.primary,
            selectedItemColor: ColorSelection.neutral,
            unselectedItemColor: ColorSelection.accent,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Query',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                label: 'Records',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
