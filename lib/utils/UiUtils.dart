import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UiUtils {
  static InputDecoration textFieldStyle(
      {String labelTextStr = "", String hintTextStr = ""}) {
    return InputDecoration(
      labelText: "$labelTextStr ",
      labelStyle: TextStyle(),
      hintText: "$hintTextStr ",
      contentPadding: EdgeInsets.only(left: 20.0, top: 1.0, bottom: 1.0),
      border: OutlineInputBorder(
          gapPadding: 1.5,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
    );
  }

  static Text headTextField({textName, colorOfText}) {
    return Text(
      textName,
      style: TextStyle(
        fontSize: 20.0,
        color: colorOfText,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Text normalTextField({textName, colorOfText}) {
    return Text(
      textName,
      style: TextStyle(
        fontSize: 15.0,
        color: colorOfText,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static Image setImages({imageName, width, height}) {
    return Image(
      image: AssetImage(imageName),
      width: width,
      height: height,
    );
  }

  static SvgPicture setSvg({imageName, width, height}) {
    return SvgPicture.asset(
      imageName,
      width: width,
      height: height,
    );
  }

  void showSnack({
    BuildContext context,
  }) {


    Scaffold.of(context).removeCurrentSnackBar();

    var snackBar = SnackBar(
      content: Text('Yay! clicked!'),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {},
      ),
    );

// Find the Scaffold in the widget tree and use it to show a SnackBar.
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void showInfoSnack({BuildContext contexts, msg}) {
    Scaffold.of(contexts).removeCurrentSnackBar();

    var snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      content: normalTextField(textName: msg, colorOfText: Colors.white),
      backgroundColor: Colors.black,
    );




// Find the Scaffold in the widget tree and use it to show a SnackBar.
    Scaffold.of(contexts).showSnackBar(snackBar);
  }
}
