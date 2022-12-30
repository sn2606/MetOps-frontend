import 'package:flutter/material.dart';

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
      padding: EdgeInsets.only(left: 25, right: 25, top: 90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
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
            padding: EdgeInsets.only(bottom: 40),
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
    );
  }
}
