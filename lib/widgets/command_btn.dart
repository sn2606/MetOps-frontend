import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CommandButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color fgColor;
  final VoidCallback navigate;

  const CommandButton.light({
    super.key,
    this.bgColor = neutral,
    this.fgColor = primary,
    required this.title,
    required this.navigate,
  });
  const CommandButton.dark({
    super.key,
    this.bgColor = primary,
    this.fgColor = neutral,
    required this.title,
    required this.navigate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        child: Text(title),
        onPressed: navigate,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.0),
            ),
          ),
          elevation: null,
          shadowColor: null,
          backgroundColor: MaterialStatePropertyAll<Color>(bgColor),
          foregroundColor: MaterialStatePropertyAll<Color>(fgColor),
          textStyle: MaterialStatePropertyAll<TextStyle>(
            TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
