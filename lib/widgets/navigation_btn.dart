import 'package:flutter/material.dart';

import '../utils/styles.dart';

/// Widget for a navigation [ElevatedButton] button.
/// Used for navigating between screens _after Login_.
class NavigationButton extends StatelessWidget {
  /// Text to be displayed on this button.
  final String title;

  /// Background color of this button.
  final Color bgColor;

  /// Navigation method called when this button is pressed.
  final VoidCallback navigation;

  /// Constructor for a custom *non-alert* navigation [ElevatedButton] button.
  /// Filled with [ColorSelection.secondaryContainer] color.
  const NavigationButton({
    super.key,
    required this.title,
    required this.navigation,
    this.bgColor = ColorSelection.secondaryContainer,
  });

  /// Constructor for a custom *alert* navigation [ElevatedButton] button.
  /// Filled with [ColorSelection.alertContainer] color.
  const NavigationButton.alert({
    super.key,
    required this.title,
    required this.navigation,
    this.bgColor = ColorSelection.alertContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(top: 11, bottom: 11),
      child: ElevatedButton(
        onPressed: navigation,
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
              const MaterialStatePropertyAll<Color>(ColorSelection.primary),
          textStyle: const MaterialStatePropertyAll<TextStyle>(
            TextStyleSelection.buttonText,
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
