import 'package:flutter/material.dart';
import 'package:login_and_signup/utils/UiUtils.dart';

class MyButton extends StatelessWidget {
  MyButton({@required this.onPressed, this.buttonName});

  final GestureTapCallback onPressed;
  final buttonName;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      minWidth: MediaQuery.of(context).size.width,
      textColor: Colors.white,
      child: UiUtils.normalTextField(
          textName: buttonName, colorOfText: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
      onPressed: onPressed,
    );
  }
}
