import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/command_btn.dart';
import '../utils/styles.dart';
import './otp.dart';

class Login extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Login({super.key});

  void navigateTo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtpVerify()),
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
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 50),
                    child: Image.asset('assets/images/meteorology.png'),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyleSelection.titleTextMainDark,
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
                              labelText: 'Username',
                              labelStyle: TextStyleSelection.primaryText),
                          cursorColor: ColorSelection.primary,
                          controller: usernameController,
                          onSubmitted: (_) => {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: TextStyleSelection.primaryText,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorSelection.primary,
                                ),
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyleSelection.primaryText),
                          cursorColor: ColorSelection.primary,
                          controller: passwordController,
                          onSubmitted: (_) => {},
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        CommandButton.dark(
                          title: 'Login',
                          navigate: (() => navigateTo(context)),
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
