import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import '../widgets/navigation_btn.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 50),
              height: 210,
              width: 210,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primary,
                ),
                color: primary,
              ),
              child: Image.asset(
                'assets/images/operator.png',
                color: neutral,
                height: 100,
                width: 100,
                alignment: Alignment.center,
              ),
            ),
            Column(
              children: [
                NavigationButton(
                  title: 'Units',
                  action: () {},
                ),
                NavigationButton(
                  title: 'Location',
                  action: () {},
                ),
                NavigationButton(
                  title: 'Privacy',
                  action: () {},
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text('v1.0.0'),
                ),
                NavigationButton.alert(
                  title: 'Sign Out',
                  action: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
