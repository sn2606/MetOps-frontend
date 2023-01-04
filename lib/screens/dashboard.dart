import 'package:flutter/material.dart';

import '../widgets/render_image.dart';
import '../widgets/navigation_btn.dart';
import '../widgets/dashboard/add_button.dart';
import '../widgets/dashboard/dash_card.dart';
import '../widgets/dashboard/weather_info.dart';
import '../utils/styles.dart';

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
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Operator!',
                        style: TextStyleSelection.titleTextHome,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Welcome back to MetOps',
                        style: TextStyleSelection.subtitleTextMainDark,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
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
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NavigationButton(
                        title: 'Observation History',
                        action: () {},
                      ),
                      NavigationButton(
                        title: 'Guidelines',
                        action: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
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
