import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CommandButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color fgColor;
  final VoidCallback navigate;

  const CommandButton.light({
    super.key,
    this.bgColor = ColorSelection.neutral,
    this.fgColor = ColorSelection.primary,
    required this.title,
    required this.navigate,
  });
  const CommandButton.dark({
    super.key,
    this.bgColor = ColorSelection.primary,
    this.fgColor = ColorSelection.neutral,
    required this.title,
    required this.navigate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
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
          textStyle: const MaterialStatePropertyAll<TextStyle>(
            TextStyleSelection.buttonText,
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
