import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './login.dart';
import '../widgets/command_btn.dart';
import '../utils/styles.dart';
import '../utils/router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: ColorSelection.primary,
        systemNavigationBarColor: ColorSelection.primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness:
            Brightness.light, //navigation bar icons' color
      ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: ColorSelection.primary,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 50),
                  child: Image.asset('assets/images/cloud_drop.png'),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyleSelection.titleTextMainLight,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'MetOps is an application for Field Artillery Meteorology',
                        style: TextStyleSelection.subtitleTextMainLight,
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      CommandButton.light(
                        title: 'Get Started',
                        navigate: () => Navigate.pushPage(context, Login()),
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
