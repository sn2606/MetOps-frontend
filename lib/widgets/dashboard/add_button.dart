import 'package:flutter/material.dart';
import 'package:metops/screens/main_screen.dart';

import '../../utils/router.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      onPressed: () => Navigate.pushPage(
        context,
        const ScaffoldCustom(
          screenIndex: 1,
        ),
      ),
      icon: const Icon(
        Icons.add,
        size: 50,
        color: Color.fromRGBO(135, 130, 166, 1),
      ),
    );
  }
}
