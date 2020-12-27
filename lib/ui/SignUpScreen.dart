import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_and_signup/utils/ImagePaths.dart';
import 'package:login_and_signup/utils/MyButton.dart';
import 'package:login_and_signup/utils/NavigationRouteNames.dart';
import 'package:login_and_signup/utils/Strings.dart';
import 'package:login_and_signup/utils/UiUtils.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreen();
  }
}

class _SignUpScreen extends State<SignUpScreen> {
  var _passwordVisibleForFirst = false;
  var _passwordVisibleForSecond = false;
  var _key = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var confirmPasswordController = TextEditingController();

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
                          textName: Strings.signUpCaps,
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
                            validator: validateFirstName,
                            controller: firstNameController,
                            keyboardType: TextInputType.text,
                            decoration: UiUtils.textFieldStyle(
                                labelTextStr: Strings.firstName,
                                hintTextStr: Strings.firstName),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: validateLastName,
                            controller: lastNameController,
                            keyboardType: TextInputType.text,
                            decoration: UiUtils.textFieldStyle(
                                labelTextStr: Strings.lastName,
                                hintTextStr: Strings.lastName),
                          ),
                        ),
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
                          padding: EdgeInsets.all(5.0),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: validatePassword,
                            controller: passwordController,
                            obscureText: !_passwordVisibleForFirst,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisibleForFirst =
                                        !_passwordVisibleForFirst;
                                  });
                                },
                                iconSize: 22.0,
                                icon: Icon(
                                  _passwordVisibleForFirst
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                              labelText: Strings.password,
                              labelStyle: TextStyle(),
                              hintText: Strings.password,
                              contentPadding: EdgeInsets.only(
                                  left: 20.0, top: 1.0, bottom: 1.0),
                              border: OutlineInputBorder(
                                  gapPadding: 1.5,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: validateConfirmPassword,
                            controller: confirmPasswordController,
                            obscureText: !_passwordVisibleForSecond,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisibleForSecond =
                                        !_passwordVisibleForSecond;
                                  });
                                },
                                iconSize: 22.0,
                                icon: Icon(
                                  _passwordVisibleForSecond
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                              labelText: Strings.confirmPassword,
                              labelStyle: TextStyle(),
                              hintText: Strings.confirmPassword,
                              contentPadding: EdgeInsets.only(
                                  left: 20.0, top: 1.0, bottom: 1.0),
                              border: OutlineInputBorder(
                                  gapPadding: 1.5,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                            ),
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
                            buttonName: Strings.signUpCaps,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UiUtils.normalTextField(
                                textName: Strings.alreadyAccount,
                                colorOfText: Colors.black),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  Strings.login,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
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

  String validateFirstName(String value) {
    if (value.isEmpty) {
      return "Required";
    } else if (value.length < 3) {
      return "Min 3";
    } else {
      return null;
    }
    // UiUtils.showInfoSnack(contexts: context, msg: "Login Success");
  }

  String validateLastName(String value) {
    if (value.isEmpty) {
      return "Required";
    } else if (value.length < 3) {
      return "Min 3";
    } else {
      return null;
    }
    // UiUtils.showInfoSnack(contexts: context, msg: "Login Success");
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "Required";
    } else if (value.length < 6) {
      return "Min 6";
    } else if (value.length > 20) {
      return "Max 20";
    } else {
      return null;
    }
    // UiUtils.showInfoSnack(contexts: context, msg: "Login Success");
  }

  String validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return "Required";
    } else if (value.length < 6) {
      return "Min 6";
    } else if (value.length > 20) {
      return "Max 20";
    } else if (value == passwordController.text) {
      return "Not match";
    } else {
      return null;
    }
    // UiUtils.showInfoSnack(contexts: context, msg: "Login Success");
  }

  void submit(BuildContext context) {
    if (_key.currentState.validate()) {
      UiUtils.showInfoSnack(contexts: context, msg: "Sign up Success");
      Navigator.pop(context);
    }
  }

  void resetFields() {
    emailController.text = '';
    passwordController.text = '';
    firstNameController.text = '';
    lastNameController.text = '';
    confirmPasswordController.text = '';
  }
}
