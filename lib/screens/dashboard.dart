import 'package:flutter/material.dart';

import '../widgets/render_image.dart';
import '../widgets/navigation_btn.dart';
import '../widgets/title_text.dart';
import '../widgets/dashboard/add_button.dart';
import '../widgets/dashboard/dash_card.dart';
import '../widgets/dashboard/weather_info.dart';
import '../utils/colors.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            top: -60,
            left: 114,
            height: 332,
            width: 330,
            child: RenderImage(
              path: 'assets/images/windy.png',
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 550,
            right: 10,
            height: 45,
            width: 45,
            child: RenderImage(
              path: 'assets/images/snowflake1.png',
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 500,
            left: 40,
            height: 35,
            width: 35,
            child: RenderImage(
              path: 'assets/images/snowflake2.png',
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 30,
            left: 55,
            height: 35,
            width: 35,
            child: RenderImage(
              path: 'assets/images/snowflake3.png',
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 180,
            left: 0,
            height: 45,
            width: 45,
            child: RenderImage(
              path: 'assets/images/snowflake4.png',
              alignment: Alignment.centerLeft,
            ),
          ),
          Positioned(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 25, right: 25, top: 90),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(title: 'Hello, Operator!'),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          'Welcome back to MetOps',
                          style: TextStyle(
                            color: primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25, top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DashCard(
                        type: 'info',
                        content: WeatherInfo(),
                      ),
                      DashCard(
                        type: 'add',
                        content: AddButton(),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NavigationButton(title: 'Observation History'),
                      NavigationButton(title: 'Guidelines'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
