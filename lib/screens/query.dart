import 'package:flutter/material.dart';
import 'package:metops/widgets/action_btn_filled.dart';
import 'package:metops/widgets/action_btn_outlined.dart';
import 'package:metops/widgets/query/instruction_text.dart';
import 'package:metops/widgets/title_text.dart';

import '../utils/colors.dart';
import '../widgets/query/text_field.dart';

class Query extends StatefulWidget {
  const Query({super.key});

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 25, right: 25, top: 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  title: 'Location Search',
                ),
                InstructionText(
                  text:
                      'Please enter the coordinates in decimal of the location you wish to search',
                ),
                InstructionText(
                  text: 'for e.g. 40.714, -74.006 (New York City)',
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 50),
            child: Row(
              children: [
                TextFieldCustom(
                  hint: 'Latitude',
                ),
                TextFieldCustom(
                  hint: 'Longitude',
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 50),
            child: Row(children: [
              ActionButtonFilled(title: 'Search'),
              ActionButtonOutlined(title: 'Cancel')
            ]),
          ),
        ],
      ),
    );
  }
}
