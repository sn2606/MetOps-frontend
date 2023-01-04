import 'package:flutter/material.dart';

import '../../screens/account.dart';
import '../../utils/router.dart';

class AppBarCustom extends StatefulWidget with PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 10),
      child: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () => Navigate.pushPage(context, Account()),
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
