import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/main_screen.dart';
import '../widgets/command_btn.dart';
import '../utils/styles.dart';

class OtpVerify extends StatelessWidget {
  final otpController = TextEditingController();

  OtpVerify({super.key});

  void navigateTo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScaffoldCustom()),
    );
  }

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
                      Container(
                        child: Text(
                          'Enter OTP',
                          style: TextStyle(
                            color: ColorSelection.primary,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Text(
                            'A 4-digit OTP has been sent to your registered mobile number',
                            style: TextStyle(
                              color: ColorSelection.secondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: TextField(
                          style: TextStyle(color: ColorSelection.primary),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorSelection.primary,
                              ),
                            ),
                            labelText: 'OTP',
                            labelStyle: TextStyle(
                              color: ColorSelection.primary,
                            ),
                          ),
                          cursorColor: ColorSelection.primary,
                          controller: otpController,
                          onSubmitted: (_) => {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 60),
                        child: CommandButton.dark(
                          title: 'Verify',
                          navigate: (() => navigateTo(context)),
                        ),
                      )
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
