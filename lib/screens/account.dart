import 'package:flutter/material.dart';

import '../utils/styles.dart';
import '../widgets/navigation_btn.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 50),
              height: 210,
              width: 210,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorSelection.primary,
                ),
                color: ColorSelection.primary,
              ),
              child: Image.asset(
                'assets/images/operator.png',
                color: ColorSelection.neutral,
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
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'v1.0.0',
                ),
                const SizedBox(
                  height: 10,
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
