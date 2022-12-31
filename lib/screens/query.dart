import 'package:flutter/material.dart';

import '../widgets/action_btn_filled.dart';
import '../widgets/action_btn_outlined.dart';
import '../widgets/query/instruction_text.dart';
import '../widgets/title_text.dart';
import '../widgets/query/text_field.dart';
import '../widgets/render_image.dart';

class Query extends StatefulWidget {
  const Query({super.key});

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: (MediaQuery.of(context).size.width - 90),
            width: 70,
            height: 70,
            child: RenderImage(
              path: 'assets/images/constellation.png',
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height - 250),
            left: (MediaQuery.of(context).size.width - 150),
            width: 80,
            height: 80,
            child: RenderImage(
              path: 'assets/images/satellite.png',
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            height: 512,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                RenderImage(
                  path: 'assets/images/arctic.png',
                  alignment: Alignment.centerLeft,
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 25, right: 25, top: 50),
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
                          TextFieldCustom(hint: 'Latitude'),
                          TextFieldCustom(hint: 'Longitude'),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
