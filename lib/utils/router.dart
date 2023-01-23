import 'package:flutter/material.dart';

/// Helper class for Navigator methods
/// Abstracted to adhere to DRY
class Navigate {
  /// Push a page onto the context
  static Future pushPage(BuildContext context, Widget page) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }

  /// Pop the current page and then push a page onto the context
  static Future popThenpushPage(BuildContext context, Widget page) async {
    Navigator.pop(context);
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }
}
