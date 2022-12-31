import 'package:flutter/material.dart';

import '../widgets/title_text.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TitleText(title: 'Records'),
        ],
      ),
    );
  }
}
