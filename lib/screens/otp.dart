import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/main_screen.dart';
import '../widgets/command_btn.dart';
import '../utils/styles.dart';
import '../utils/router.dart';

class OtpVerify extends StatelessWidget {
  final otpController = TextEditingController();

  OtpVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorSelection.neutral,
        systemNavigationBarColor: ColorSelection.neutral,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25, top: 50),
                  child: Image.asset('assets/images/weather.png'),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter OTP',
                        style: TextStyleSelection.titleTextMainDark,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'A 4-digit OTP has been sent to your registered mobile number',
                        style: TextStyleSelection.subtitleTextMainDark,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        style: TextStyleSelection.primaryText,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorSelection.primary,
                            ),
                          ),
                          labelText: 'OTP',
                          labelStyle: TextStyleSelection.primaryText,
                        ),
                        cursorColor: ColorSelection.primary,
                        controller: otpController,
                        onSubmitted: (_) => {},
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      CommandButton.dark(
                        title: 'Verify',
                        navigate: (() => Navigate.pushPage(
                            context,
                            ScaffoldCustom(
                              screenIndex: 0,
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
