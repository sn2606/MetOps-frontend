import 'package:flutter/material.dart';

import 'package:metops/utils/colors.dart';

class BottomBar extends StatefulWidget {
  final int screenIndex;
  final void Function(int) bindScreens;
  final List<Widget?> screens;
  const BottomBar({
    super.key,
    required this.screenIndex,
    required this.bindScreens,
    required this.screens,
  });

  @override
  State<BottomBar> createState() => _BottomBarState(
      screenIndex: screenIndex, bindScreens: bindScreens, screens: screens);
}

class _BottomBarState extends State<BottomBar> {
  final int screenIndex;
  final void Function(int) bindScreens;
  final List<Widget?> screens;

  _BottomBarState(
      {required this.screenIndex,
      required this.bindScreens,
      required this.screens});

  @override
  Widget build(BuildContext context) {
    final double _radius = kBottomNavigationBarHeight / 2;

    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(_radius)),
        child: BottomNavigationBar(
          // iconSize: 20,
          currentIndex: screenIndex, //state management
          onTap: bindScreens,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: primary,
          selectedItemColor: neutral,
          unselectedItemColor: accent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Query',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Records',
            ),
          ],
        ),
      ),
    );
  }
}
