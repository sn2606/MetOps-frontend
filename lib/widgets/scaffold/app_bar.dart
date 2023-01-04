import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/styles.dart';
import '../../screens/account.dart';

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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorSelection.neutral,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: ColorSelection.neutral,
        elevation: 0,
        iconTheme: IconThemeData(
          color: ColorSelection.primary,
          size: 30,
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Account()),
                );
              },
              child: Ink(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                height: 50,
                width: 50,
                child: const Icon(
                  Icons.settings_outlined,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
