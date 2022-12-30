import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metops/utils/colors.dart';

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
          statusBarColor: neutral,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: neutral,
        elevation: 0,
        iconTheme: IconThemeData(
          color: primary,
          size: 30,
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.account_circle_outlined,
                ),
              )),
        ],
      ),
    );
  }
}
