import 'package:flutter/material.dart';

Widget appBarWidgetMain(BuildContext context) {
  return AppBar(
    title: Text(
      "ConnectMe",
    ),
  );
}

InputDecoration textInputDecoration(String hintTextURL) {
  return InputDecoration(
    hintText: hintTextURL,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.green[400],
      ),
    ),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
      color: Colors.white,
    )),
    hintStyle: TextStyle(
      color: Colors.white54,
    ),
  );
}

TextStyle simpleTextStyle(Color color, double fontSize) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
  );
}

Container signInMainButtons(String text, dynamic context, String cond) {
  if (cond == 'first') {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green,
            Colors.green,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  } else {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
