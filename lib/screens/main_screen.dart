import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/styles.dart';
import '../widgets/scaffold/app_bar.dart';
import '../widgets/scaffold/drawer.dart';
import './dashboard.dart';
import './query.dart';
import './records.dart';

/// Custom main screen design.
class ScaffoldCustom extends StatefulWidget {
  final int screenIndex;

  /// Constructor for the custom scaffold design of the main screen.
  const ScaffoldCustom({super.key, required this.screenIndex});

  @override
  State<ScaffoldCustom> createState() => _ScaffoldCustomState();
}

class _ScaffoldCustomState extends State<ScaffoldCustom> {
  /// List of screens to be displayed
  final List<Widget?> _screens = [
    const Dashboard(),
    const Query(),
    const Records()
  ];

  /// The index of screen [bottomnavigationbar] is focusing on.
  late int _screenIndex;

  @override
  void initState() {
    super.initState();
    _screenIndex = widget.screenIndex;
  }

  /// Display screen from [_screens] at index [index].
  void _bindScreens(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Radius of curvature of Bottom Navigation Bar for the design.
    const double radius = kBottomNavigationBarHeight / 2;
    final AppBar appBar = AppBar();

    /// Height of Scroll View
    final bodyHeight = MediaQuery.of(context).size.height -
        -appBar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        kBottomNavigationBarHeight -
        130;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: ColorSelection.neutral,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: const AppBarCustom(),
        drawer: const DrawerCustom(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: bodyHeight,
            child: _screens[_screenIndex],
          ),
        ),
        bottomNavigationBar: Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
