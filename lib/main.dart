import 'package:flutter/material.dart';
import 'package:login_and_signup/ui/ForgotPasswordScreen.dart';
import 'package:login_and_signup/ui/LoginScreen.dart';
import 'package:login_and_signup/ui/SignUpScreen.dart';
import 'package:login_and_signup/utils/NavigationRouteNames.dart';

import 'ui/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        NavigationRouteNames.login: (context) => LoginScreen(),
        NavigationRouteNames.signUp: (context) => SignUpScreen(),
        NavigationRouteNames.forgotPassword: (context) => ForgotPasswordScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        // appBar: AppBar(
        //   title: Text("njj"),
        // ),
        body: SplashScreen(),
      ),
    );
  }
}
