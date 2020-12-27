import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_and_signup/utils/ImagePaths.dart';
import 'package:login_and_signup/utils/MyButton.dart';
import 'package:login_and_signup/utils/Strings.dart';
import 'package:login_and_signup/utils/UiUtils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordScreen();
  }
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {

  var _key = GlobalKey<FormState>();

  var emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Container(
            padding: EdgeInsets.all(25.0),
            child: Center(
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.00),
                      child: UiUtils.setSvg(
                          imageName: ImagePaths.loginLogo,
                          width: 100.0,
                          height: 100.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 2.0),
                      child: UiUtils.headTextField(
                          textName: Strings.forgotPass,
                          colorOfText: Colors.blue),
                    ),
                    Flexible(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: TextFormField(
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: validateEmail,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: UiUtils.textFieldStyle(
                                    labelTextStr: Strings.email,
                                    hintTextStr: Strings.email),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, bottom: 10.0, right: 10.0),
                              child: MyButton(
                                onPressed: () {
                                  setState(() {
                                    submit(context);
                                  });
                                },
                                buttonName: Strings.getPassword,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  String validateEmail(String value) {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (value.isEmpty) {
      return "Required";
    } else if (!emailValid) {
      return "Valid email";
    } else {
      return null;
    }
    // UiUtils.showInfoSnack(contexts: context, msg: "Login Success");
  }


  void submit(BuildContext context) {
    if (_key.currentState.validate()) {
      UiUtils.showInfoSnack(contexts: context, msg: "Password Send Successfully");
      Navigator.pop(context);
    }
  }

  void resetFields() {
    emailController.text = '';
  }
}
