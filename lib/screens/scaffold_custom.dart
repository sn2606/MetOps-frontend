import 'package:flutter/material.dart';
import 'package:metops/widgets/bottom_bar.dart';

class ScaffoldCustom extends StatefulWidget {
  const ScaffoldCustom({super.key});

  @override
  State<ScaffoldCustom> createState() => _ScaffoldCustomState();
}

class _ScaffoldCustomState extends State<ScaffoldCustom> {
  final List<Widget?> _screens = [
    const Text('Query'),
    const Text('Dashboard'),
    const Text('Records')
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
      appBar: AppBar(
        title: Text('MetOps'),
      ),
      body: _screens[_screenIndex],
      // extendBody: true,
      bottomNavigationBar: BottomBar(
        screenIndex: _screenIndex,
        bindScreens: _bindScreens,
        screens: _screens,
      ),
    );
  }
}
