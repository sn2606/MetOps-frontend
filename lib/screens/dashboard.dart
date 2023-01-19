import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../screens/main_screen.dart';
import '../screens/account.dart';
import '../widgets/render_image.dart';
import '../widgets/navigation_btn.dart';
import '../widgets/dashboard/add_button.dart';
import '../widgets/dashboard/dash_card.dart';
import '../widgets/dashboard/weather_info.dart';
import '../utils/styles.dart';
import '../utils/router.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void get _locationStatus async {
    PermissionStatus status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {}
  }

  @override
  void initState() {
    _locationStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          const Positioned(
            top: -60,
            left: 114,
            height: 332,
            width: 330,
            child: RenderImage(
              path: 'assets/images/windy.png',
              alignment: Alignment.center,
            ),
          ),
          const Positioned(
            top: 550,
            right: 10,
            height: 45,
            width: 45,
            child: RenderImage(
              path: 'assets/images/snowflake1.png',
              alignment: Alignment.center,
            ),
          ),
          const Positioned(
            top: 500,
            left: 40,
            height: 35,
            width: 35,
            child: RenderImage(
              path: 'assets/images/snowflake2.png',
              alignment: Alignment.center,
            ),
          ),
          const Positioned(
            top: 30,
            left: 55,
            height: 35,
            width: 35,
            child: RenderImage(
              path: 'assets/images/snowflake3.png',
              alignment: Alignment.center,
            ),
          ),
          const Positioned(
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
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
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
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NavigationButton(
                        title: 'Observation History',
                        action: () => Navigate.pushPage(
                          context,
                          const ScaffoldCustom(
                            screenIndex: 2,
                          ),
                        ),
                      ),
                      NavigationButton(
                        title: 'Account',
                        action: () => Navigate.pushPage(
                          context,
                          const Account(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
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
