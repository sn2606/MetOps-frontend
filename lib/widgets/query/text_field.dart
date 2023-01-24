import 'package:flutter/material.dart';

import '../../utils/styles.dart';

/// Custom design of textfield for Latitude and Longitude input.
class TextFieldCustom extends StatelessWidget {
  /// Hint text to be displayed in the textfield
  final String hint;

  /// Track Latitude or Longitude
  final TextEditingController controller;

  /// Constructor for custom textfield widget for Latitude and Longitude input.
  const TextFieldCustom(
      {super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 150,
      height: 50,
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        enabled: true,
        cursorColor: ColorSelection.primary,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: ColorSelection.tertiary,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          filled: true,
          fillColor: ColorSelection.neutralVariantContainer,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorSelection.primary,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              color: Color.fromRGBO(55, 64, 121, 1),
            ),
          ),
        ),
      ),
    );
  }
}
