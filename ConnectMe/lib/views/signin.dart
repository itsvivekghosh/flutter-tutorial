import 'package:flutter/material.dart';
import 'package:ConnectMe/widgets/widget.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidgetMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 80,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  style: simpleTextStyle(Colors.white, 16),
                  decoration: textInputDecoration('Email'),
                ),
                TextField(
                  style: simpleTextStyle(Colors.white, 16),
                  decoration: textInputDecoration('Password'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text("Forgot Password?",
                        style: simpleTextStyle(Colors.white, 16)),
                  ),
                ),
                SizedBox(height: 16),
                signInMainButtons(
                  "Sign In",
                  context,
                  'sign_in',
                ),
                SizedBox(height: 8),
                signInMainButtons(
                  "Sign In With Google",
                  context,
                  "sign_in_with_google",
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have any account? ",
                      style: simpleTextStyle(Colors.white, 16),
                    ),
                    Text(
                      "Register Now",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.5)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
