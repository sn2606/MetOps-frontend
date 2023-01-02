import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/command_btn.dart';
import '../utils/colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness:
            Brightness.light, //navigation bar icons' color
      ),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: primary,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25, top: 50),
                  child: Image.asset('assets/images/cloud_drop.png'),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                            color: neutral,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Text(
                          'MetOps is an application for Field Artillery Meteorology',
                          style: TextStyle(
                            color: neutral,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 85),
                        child: CommandButton.light(title: 'Get Started'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
