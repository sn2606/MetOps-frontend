import 'package:flutter/material.dart';

import '../utils/colors.dart';

class NavigationButton extends StatelessWidget {
  final String title;

  const NavigationButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(top: 11, bottom: 11),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(title),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          elevation: null,
          shadowColor: null,
          backgroundColor: MaterialStatePropertyAll<Color>(secondaryContainer),
          foregroundColor: MaterialStatePropertyAll<Color>(primary),
          textStyle: MaterialStatePropertyAll<TextStyle>(
            TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
