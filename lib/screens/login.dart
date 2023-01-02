import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/command_btn.dart';
import '../utils/colors.dart';
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
        statusBarColor: neutral,
        systemNavigationBarColor: neutral,
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
                  child: Image.asset('assets/images/meteorology.png'),
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
                          'Login',
                          style: TextStyle(
                            color: primary,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: TextField(
                          style: TextStyle(color: primary),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: primary,
                              ),
                            ),
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              color: primary,
                            ),
                          ),
                          cursorColor: primary,
                          controller: usernameController,
                          onSubmitted: (_) => {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: TextField(
                          style: TextStyle(color: primary),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: primary,
                              ),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: primary,
                            ),
                          ),
                          cursorColor: primary,
                          controller: passwordController,
                          keyboardType: TextInputType.number,
                          onSubmitted: (_) => {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 60),
                        child: CommandButton.dark(
                          title: 'Login',
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
