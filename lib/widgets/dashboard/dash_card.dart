import 'package:flutter/material.dart';

import '../../utils/styles.dart';

/// Dashboard card widget
class DashCard extends StatefulWidget {
  /// Two types of Dashboard card.
  /// One card that displayes weather information - 'info'.
  /// Other card that displays the add button.
  final String type;

  /// Content to display in the card.
  final Widget content;

  /// Constructor for dashboard card widget.
  /// Requires type of card - either 'info' or other.
  /// And a widget containing the content to be displayed on the card.
  const DashCard({super.key, required this.type, required this.content});

  @override
  State<DashCard> createState() => _DashCardState();
}

class _DashCardState extends State<DashCard> {
  late String? _type;
  late Widget _content;

  @override
  void initState() {
    super.initState();
    _type = widget.type;
    _content = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 150,
      margin: const EdgeInsets.only(right: 20),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(color: ColorSelection.primary),
        ),
        elevation: null,
        color: _type == 'info'
            ? ColorSelection.tertiaryContainer
            : ColorSelection.primaryContainer,
        child: _content,
      ),
    );
  }
}
