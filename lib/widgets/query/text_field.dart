import 'package:flutter/material.dart';
import 'package:metops/utils/colors.dart';

class TextFieldCustom extends StatelessWidget {
  final String hint;

  const TextFieldCustom({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 150,
      height: 50,
      child: TextField(
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        enabled: true,
        cursorColor: primary,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: tertiary,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          filled: true,
          fillColor: neutralVariantContainer,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primary,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(
                color: Color.fromRGBO(55, 64, 121, 1),
              )),
        ),
      ),
    );
  }
}
