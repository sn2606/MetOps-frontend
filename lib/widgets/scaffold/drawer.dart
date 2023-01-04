import 'package:flutter/material.dart';

import '../../screens/account.dart';
import '../../screens/main_screen.dart';
import '../../utils/styles.dart';
import '../../utils/router.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorSelection.primary,
      child: ListView(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 100,
          ),
          children: [
            ListTile(
              title: const Text('Account'),
              textColor: ColorSelection.neutral,
              leading: Icon(Icons.person),
              iconColor: ColorSelection.neutral,
              onTap: () => Navigate.popThenpushPage(context, Account()),
            ),
            ListTile(
              title: const Text('Home'),
              textColor: ColorSelection.neutral,
              leading: Icon(Icons.home),
              iconColor: ColorSelection.neutral,
              onTap: () => Navigate.popThenpushPage(
                  context,
                  ScaffoldCustom(
                    screenIndex: 0,
                  )),
            ),
            ListTile(
              title: const Text('Sign Out'),
              textColor: ColorSelection.neutral,
              leading: Icon(Icons.logout),
              iconColor: ColorSelection.neutral,
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text(
                'v1.0.0 © MetOps',
                style: TextStyleSelection.neutralText,
              ),
              enabled: false,
            ),
          ]),
    );
  }
}
