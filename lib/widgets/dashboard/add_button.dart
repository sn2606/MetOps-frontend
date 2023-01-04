import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      onPressed: () {},
      icon: Icon(
        Icons.add,
        size: 50,
        color: Color.fromRGBO(135, 130, 166, 1),
      ),
    );
  }
}
