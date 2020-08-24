import 'dart:ui';
import 'package:ConnectMe/helper/helperFunctions.dart';
import 'package:ConnectMe/services/auth.dart';
import 'package:ConnectMe/services/database.dart';
import 'package:ConnectMe/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:ConnectMe/views/chatRoomScreen.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  signUp() async {
    if (formKey.currentState.validate()) {

      Map<String, String> userMap = {
        'name': usernameEditingController.text,
        'email': emailEditingController.text,
      };

      HelperFunctions.saveUserEmailSharedPreference(emailEditingController.text);
      HelperFunctions.saveUserNameSharedPreference(usernameEditingController.text);

      setState(() {
        isLoading = true;
      });

      await authService
          .signUpWithEmailAndPassword(
              emailEditingController.text, passwordEditingController.text)
          .then(
        (value) {

          databaseMethods.uploadUserInfo(userMap);
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRoom(),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidgetMain(context),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 80,
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                return value.isEmpty || value.length < 3
                                    ? "Enter Username 3+ characters"
                                    : null;
                              },
                              controller: usernameEditingController,
                              style: simpleTextStyle(Colors.white, 16),
                              decoration: textInputDecoration('Username'),
                            ),
                            TextFormField(
                              validator: (value) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)
                                    ? null
                                    : "Enter provide valid email";
                              },
                              controller: emailEditingController,
                              style: simpleTextStyle(Colors.white, 16),
                              decoration: textInputDecoration('Email'),
                            ),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                return value.length < 6
                                    ? "Enter Password 6+ characters"
                                    : null;
                              },
                              controller: passwordEditingController,
                              style: simpleTextStyle(Colors.white, 16),
                              decoration: textInputDecoration('Password'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Text("Forgot Password?",
                              style: simpleTextStyle(Colors.white, 16)),
                        ),
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          signUp();
                        },
                        child: signInMainButtons(
                          "Sign Up",
                          context,
                          'first',
                        ),
                      ),
                      SizedBox(height: 8),
                      signInMainButtons(
                        "Sign Un With Google",
                        context,
                        "second",
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: simpleTextStyle(Colors.white, 16),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                widget.toggle();
                              },
                              child: Text(
                                "Login Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                ),
                              ),
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
