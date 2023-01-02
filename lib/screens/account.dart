import 'package:flutter/material.dart';
import 'package:metops/utils/colors.dart';
import 'package:metops/widgets/navigation_btn.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 25, right: 25),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 100),
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
              NavigationButton(title: 'Settings'),
              NavigationButton(title: 'Sign Out'),
            ],
          ),
        ],
      ),
    );
  }
}
