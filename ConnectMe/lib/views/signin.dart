import 'package:ConnectMe/helper/helperFunctions.dart';
import 'package:ConnectMe/services/auth.dart';
import 'package:ConnectMe/services/database.dart';
import 'package:ConnectMe/views/chatRoomScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ConnectMe/widgets/widget.dart';

class SignIn extends StatefulWidget {

  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool isLoading = false;
  QuerySnapshot queryUserSnapshot;
  final formKey = GlobalKey<FormState>();
  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  signMeIn() {
      if (formKey.currentState.validate()) {
        HelperFunctions.saveUserEmailSharedPreference(emailEditingController.text);

        databaseMethods.getUsersByUserEmail(emailEditingController.text)
        .then((val) {
          queryUserSnapshot = val;
          HelperFunctions
              .saveUserNameSharedPreference(queryUserSnapshot.documents[0].data['name']);
        });

        setState(() {
          isLoading = true;
        });

        authService.signInWithEmailAndPassword(
            emailEditingController.text,
            passwordEditingController.text).then((val) {
              if (val != null) {
                HelperFunctions.saveUserLoggedInSharedPreference(true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatRoom(),
                  ),
                );
              }
        });

      }
  }
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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text("Forgot Password?",
                          style: simpleTextStyle(Colors.white, 16)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    signMeIn();
                  },
                  child: signInMainButtons(
                    "Sign In",
                    context,
                    'first',
                  ),
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
                    GestureDetector(
                      onTap: () {
                        widget.toggle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Register Now",
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
