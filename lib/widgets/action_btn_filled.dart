import 'package:flutter/material.dart';

import '../utils/styles.dart';

class ActionButtonFilled extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ActionButtonFilled({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 35,
      margin: const EdgeInsets.only(right: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ColorSelection.secondary.withOpacity(0.5);
              }
              return ColorSelection.primary;
            },
          ),
          foregroundColor:
              const MaterialStatePropertyAll<Color>(ColorSelection.neutral),
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
