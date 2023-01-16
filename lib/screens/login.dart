import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metops/screens/main_screen.dart';

import '../models/user.dart';
import '../widgets/command_btn.dart';
import '../utils/styles.dart';
import '../utils/router.dart';
import '../services/auth_service.dart';

class Login extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final auth = AuthService();

  Login({super.key});

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
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 25, right: 25, top: 50),
                    child: Image.asset('assets/images/meteorology.png'),
                  ),
                ),
                Expanded(
                  child: _loginForm(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login',
              style: TextStyleSelection.titleTextMainDark,
            ),
            const SizedBox(
              height: 25,
            ),
            _usernameField(),
            const SizedBox(
              height: 10,
            ),
            _passwordField(),
            const SizedBox(
              height: 60,
            ),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      style: TextStyleSelection.primaryText,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorSelection.primary,
          ),
        ),
        labelText: 'Username',
        labelStyle: TextStyleSelection.primaryText,
      ),
      cursorColor: ColorSelection.primary,
      controller: usernameController,
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      style: TextStyleSelection.primaryText,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorSelection.primary,
          ),
        ),
        labelText: 'Password',
        labelStyle: TextStyleSelection.primaryText,
      ),
      cursorColor: ColorSelection.primary,
      controller: passwordController,
    );
  }

  void _loginHelper(BuildContext context, VoidCallback ifOk) async {
    final response =
        await auth.login(usernameController.text, passwordController.text);
    if (response['status'] == 200) {
      User loggedIn = response['user'];
      ifOk();
    } else {
      usernameController.clear();
      passwordController.clear();
    }
  }

  Widget _loginButton(BuildContext context) {
    return CommandButton.dark(
      title: 'Login',
      navigate: () => _loginHelper(
        context,
        () {
          Navigate.pushPage(
            context,
            const ScaffoldCustom(screenIndex: 0),
          );
        },
      ),
    );
  }
}
