import 'package:flutter/material.dart';

import '../widgets/action_btn_filled.dart';
import '../widgets/action_btn_outlined.dart';
import '../widgets/query/instruction_text.dart';
import '../widgets/title_text.dart';
import '../widgets/query/text_field.dart';

class Query extends StatefulWidget {
  const Query({super.key});

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);

    return Container(
      height: 800,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: (MediaQuery.of(context).size.width - 90),
            width: 70,
            height: 70,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('assets/images/constellation.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height - 250),
            left: (MediaQuery.of(context).size.width - 150),
            width: 80,
            height: 80,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/satellite.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            height: 512,
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 512,
              child: Stack(
                children: [
                  Container(
                    height: 512,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/images/arctic.png'),
                      ),
                    ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
