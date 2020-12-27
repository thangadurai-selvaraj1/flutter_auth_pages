
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_and_signup/utils/ImagePaths.dart';
import 'package:login_and_signup/utils/MyButton.dart';
import 'package:login_and_signup/utils/NavigationRouteNames.dart';
import 'package:login_and_signup/utils/Strings.dart';
import 'package:login_and_signup/utils/UiUtils.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  var _passwordVisible = false;
  var _key = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();



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
                          textName: Strings.login, colorOfText: Colors.blue),
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
                          padding: EdgeInsets.all(5.0),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: validatePassword,
                            controller: passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                iconSize: 22.0,
                                icon: Icon(
                                  _passwordVisible
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
                          padding: EdgeInsets.only(right: 15.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      NavigationRouteNames.forgotPassword);
                                },
                                child: UiUtils.normalTextField(
                                    textName: Strings.forgotPassword,
                                    colorOfText: Colors.black),
                              )
                            ],
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
                            buttonName: Strings.login,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UiUtils.normalTextField(
                                textName: Strings.donAccount,
                                colorOfText: Colors.black),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, NavigationRouteNames.signUp);
                                },
                                child: Text(
                                  Strings.signUp,
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

  void submit(BuildContext context) {
    if (_key.currentState.validate()) {
      if (emailController.text == "alvin@gmail.com" &&
          passwordController.text == "123456")
        UiUtils.showInfoSnack(contexts: context, msg: "Login Success");
      else {
        UiUtils.showInfoSnack(contexts: context, msg: "Invalid Crendentials");
      }
    }
  }

  void resetFields() {
    emailController.text = '';
    passwordController.text = '';
  }
}
