import 'package:flutter/material.dart';
import 'package:metops/utils/colors.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primary,
      child: ListView(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 100,
          ),
          children: [
            ListTile(
              title: const Text('Account'),
              textColor: neutral,
              leading: Icon(Icons.person),
              iconColor: neutral,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              textColor: neutral,
              leading: Icon(Icons.settings),
              iconColor: neutral,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Home'),
              textColor: neutral,
              leading: Icon(Icons.home),
              iconColor: neutral,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sign Out'),
              textColor: neutral,
              leading: Icon(Icons.logout),
              iconColor: neutral,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('v1.0.0 © MetOps'),
              textColor: neutral,
              onTap: null,
            ),
          ]),
    );
  }
}
