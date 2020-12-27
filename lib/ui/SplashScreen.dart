import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_and_signup/ui/LoginScreen.dart';
import 'package:login_and_signup/utils/Strings.dart';
import 'package:login_and_signup/utils/UiUtils.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {

  // AnimationController _animController;
  // Animation<Offset> _animOffset;
  // final int delay = 500;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2),
            () =>
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen())));

    //
    // _animController =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    // final curve =
    // CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    // _animOffset =
    //     Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
    //         .animate(curve);
    //
    // if (delay == null) {
    //   _animController.forward();
    // } else {
    //   Timer(Duration(milliseconds: delay), () {
    //     _animController.forward();
    //   });
    // }
  }

  @override
  void dispose() {
    super.dispose();
    // _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: UiUtils.headTextField(
            textName: Strings.welcomeMessage, colorOfText: Colors.white),
      ),
    );
    // FadeTransition(
    //   child: SlideTransition(
    //     position: _animOffset,
    //     child: Center(
    //       child: Container(
    //         child: UiUtils.headTextField(
    //             textName: Strings.welcomeMessage, colorOfText: Colors.white),
    //       ),
    //     ),
    //   ),
    //   opacity: _animController,
    // );
  }
}
