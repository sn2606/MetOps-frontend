import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import '../screens/main_screen.dart';
import '../services/auth_service.dart';
import '../utils/router.dart';
import '../utils/styles.dart';
import '../widgets/command_btn.dart';

/// Login screen of the app. Contains the login form.
class Login extends StatelessWidget {
  /// Track username input
  final usernameController = TextEditingController();

  /// Track password input
  final passwordController = TextEditingController();

  /// State key associated with login form
  final _formKey = GlobalKey<FormState>();

  /// Instance of [AuthService] class defined in [auth_service.dart]
  final auth = AuthService();

  /// Getter method to get location permission from the user.
  /// Uses [permission_handler] package.
  void get _locationStatus async {
    PermissionStatus status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {}
  }

  /// Constructor for the Login screen of the app. Contains the login form.
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    _locationStatus;
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

  /// Login form design
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

  /// TextFormField for Username input.
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

  /// TextFormField for Password input.
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

  /// Helper method to perform authentication.
  /// Uses [login] function defined in [auth_service.dart]
  void _loginHelper(BuildContext context, VoidCallback ifOk) async {
    final response =
        await auth.login(usernameController.text, passwordController.text);
    // If login successful on server side.
    if (response['status'] == 200) {
      // User loggedIn = response['user'];
      ifOk();
    } else {
      usernameController.clear();
      passwordController.clear();
    }
  }

  /// Button for login.
  /// Custom widget defined in [command_btn.dart]
  /// Calls [_loginHelper] method when pressed
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
