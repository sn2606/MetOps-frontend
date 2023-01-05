import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class BottomBar extends StatefulWidget {
  final int screenIndex;
  final void Function(int) bindScreens;

  const BottomBar({
    super.key,
    required this.screenIndex,
    required this.bindScreens,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late int _screenIndex;
  late void Function(int) _bindScreens;

  @override
  void initState() {
    super.initState();
    _screenIndex = widget.screenIndex;
    _bindScreens = widget.bindScreens;
  }

  @override
  Widget build(BuildContext context) {
    const double radius = kBottomNavigationBarHeight / 2;

    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(radius)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _screenIndex, //state management
          onTap: _bindScreens,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: ColorSelection.primary,
          selectedItemColor: ColorSelection.neutral,
          unselectedItemColor: ColorSelection.accent,
          items: const [
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
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
