import 'package:flutter/material.dart';

import '../utils/styles.dart';

class NavigationButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final VoidCallback action;

  const NavigationButton({
    super.key,
    required this.title,
    required this.action,
    this.bgColor = ColorSelection.secondaryContainer,
  });

  const NavigationButton.alert({
    super.key,
    required this.title,
    required this.action,
    this.bgColor = ColorSelection.alertContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(top: 11, bottom: 11),
      child: ElevatedButton(
        onPressed: action,
        child: Text(title),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          elevation: null,
          shadowColor: null,
          backgroundColor: MaterialStatePropertyAll<Color>(bgColor),
          foregroundColor:
              MaterialStatePropertyAll<Color>(ColorSelection.primary),
          textStyle: MaterialStatePropertyAll<TextStyle>(
            TextStyleSelection.buttonText,
          ),
        ),
      ),
    );
  }
}
