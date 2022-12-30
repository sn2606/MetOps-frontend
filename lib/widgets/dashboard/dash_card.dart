import 'package:flutter/material.dart';

import 'package:metops/utils/colors.dart';

class DashCard extends StatefulWidget {
  final String type;
  final Widget content;
  DashCard({super.key, required this.type, required this.content});

  @override
  State<DashCard> createState() => _DashCardState(type: type, content: content);
}

class _DashCardState extends State<DashCard> {
  final String? type;
  final Widget content;

  _DashCardState({required this.type, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 150,
      margin: EdgeInsets.only(right: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(color: primary),
        ),
        elevation: null,
        color: type == 'info' ? tertiaryContainer : primaryContainer,
        child: Align(
          alignment: Alignment.center,
          child: content,
        ),
      ),
    );
  }
}
