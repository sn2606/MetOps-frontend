import 'package:flutter/material.dart';

import '../../screens/account.dart';
import '../../utils/router.dart';

/// App Bar of the app.
/// Used in custom scaffold of the main screen.
/// Abstracted to make code more readable.
class AppBarCustom extends StatefulWidget with PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: AppBar(
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () => Navigate.pushPage(context, const Account()),
              icon: const Icon(
                Icons.settings_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
