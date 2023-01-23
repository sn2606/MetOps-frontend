import 'package:flutter/material.dart';

import '../../screens/main_screen.dart';
import '../../utils/router.dart';

/// Icon Button with add symbol.
/// For the second dashboard card.
class AddButton extends StatelessWidget {
  /// Constructor for Icon Button with add symbol.
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      // When pressed, route to Query screen of the app
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
