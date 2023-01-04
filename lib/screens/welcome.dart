import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './login.dart';
import '../widgets/command_btn.dart';
import '../utils/styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void navigateTo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorSelection.primary,
        systemNavigationBarColor: ColorSelection.primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness:
            Brightness.light, //navigation bar icons' color
      ),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: ColorSelection.primary,
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
                          style: TextStyleSelection.titleTextMainLight,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Text(
                          'MetOps is an application for Field Artillery Meteorology',
                          style: TextStyleSelection.subtitleTextMainLight,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 85),
                        child: CommandButton.light(
                          title: 'Get Started',
                          navigate: () => navigateTo(context),
                        ),
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
