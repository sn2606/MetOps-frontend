import 'package:flutter/material.dart';

import '../utils/styles.dart';

/// Widget for a call to action [OutlinedButton] button.
/// Outlined with [ColorSelection.primary] color.
class ActionButtonOutlined extends StatelessWidget {
  /// Text to be displayed on this button.
  final String title;

  /// Action method called when this button is pressed.
  final VoidCallback onPressed;

  /// Constructor for a custom call to action [OutlinedButton] button.
  /// Outlined with [ColorSelection.primary] color.
  const ActionButtonOutlined({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 35,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(color: ColorSelection.primary),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ColorSelection.primary.withOpacity(0.5);
              }
              return null;
            },
          ),
          foregroundColor:
              const MaterialStatePropertyAll<Color>(ColorSelection.primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
