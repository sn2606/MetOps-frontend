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
      value: const SystemUiOverlayStyle(
        statusBarColor: ColorSelection.neutral,
        systemNavigationBarColor: ColorSelection.neutral,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 25, right: 25, top: 50),
                    child: Image.asset('assets/images/weather.png'),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Enter OTP',
                          style: TextStyleSelection.titleTextMainDark,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          'A 4-digit OTP has been sent to your registered mobile number',
                          style: TextStyleSelection.subtitleTextMainDark,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextField(
                          style: TextStyleSelection.primaryText,
                          decoration: const InputDecoration(
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
                        const SizedBox(
                          height: 60,
                        ),
                        CommandButton.dark(
                          title: 'Verify',
                          navigate: (() => Navigate.pushPage(
                                context,
                                const ScaffoldCustom(
                                  screenIndex: 0,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
