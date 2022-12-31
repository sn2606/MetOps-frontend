import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ActionButtonOutlined extends StatelessWidget {
  final String title;
  const ActionButtonOutlined({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 35,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(color: primary),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return primary.withOpacity(0.5);
              }
              return null;
            },
          ),
          foregroundColor: MaterialStatePropertyAll<Color>(primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(title),
      ),
    );
  }
}
