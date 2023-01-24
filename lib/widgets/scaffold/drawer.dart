import 'package:flutter/material.dart';

import '../../screens/account.dart';
import '../../screens/main_screen.dart';
import '../../utils/styles.dart';
import '../../utils/router.dart';
import '../../services/auth_service.dart';

/// Drawer of the app.
/// Used in custom scaffold of the main screen.
/// Abstracted to make code more readable.
class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorSelection.primary,
      child: ListView(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 100,
          ),
          children: [
            ListTile(
              title: const Text('Account'),
              textColor: ColorSelection.neutral,
              leading: const Icon(Icons.person),
              iconColor: ColorSelection.neutral,
              onTap: () => Navigate.popThenpushPage(context, const Account()),
            ),
            ListTile(
              title: const Text('Home'),
              textColor: ColorSelection.neutral,
              leading: const Icon(Icons.home),
              iconColor: ColorSelection.neutral,
              onTap: () => Navigate.popThenpushPage(
                context,
                const ScaffoldCustom(
                  screenIndex: 0,
                ),
              ),
            ),
            ListTile(
              title: const Text('Sign Out'),
              textColor: ColorSelection.neutral,
              leading: const Icon(Icons.logout),
              iconColor: ColorSelection.neutral,
              onTap: () => logoutUser(context),
            ),
            const ListTile(
              title: Text(
                'v1.0.0 © MetOps',
                style: TextStyleSelection.neutralText,
              ),
              enabled: false,
            ),
          ]),
    );
  }
}
