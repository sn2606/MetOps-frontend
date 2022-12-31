import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class InstructionText extends StatelessWidget {
  final String text;
  const InstructionText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Text(
        text,
        style: TextStyle(
          color: primary,
          fontSize: 12,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
