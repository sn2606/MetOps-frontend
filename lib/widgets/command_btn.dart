import 'package:flutter/material.dart';

import '../utils/styles.dart';

/// Widget for a command [ElevatedButton] button.
/// Used for navigating between screens _before Login_.
class CommandButton extends StatelessWidget {
  /// Text to be displayed on this button.
  final String title;

  /// Background color of this button.
  final Color bgColor;

  /// Foreground color of this button.
  final Color fgColor;

  /// Navigation method called when this button is pressed.
  final VoidCallback navigate;

  /// Constructor for a custom *light* command [ElevatedButton] button.
  /// Filled with [ColorSelection.neutral] color.
  const CommandButton.light({
    super.key,
    this.bgColor = ColorSelection.neutral,
    this.fgColor = ColorSelection.primary,
    required this.title,
    required this.navigate,
  });

  /// Constructor for a custom *dark* command [ElevatedButton] button.
  /// Filled with [ColorSelection.primary] color.
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
