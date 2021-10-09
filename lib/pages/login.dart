import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_plus/home.dart';
import 'package:news_app_plus/pages/home.dart';
import 'package:news_app_plus/pages/loginWithEmail.dart';
import 'package:news_app_plus/pages/signUp.dart';
import 'package:news_app_plus/services/auth.dart';
import 'package:news_app_plus/widgets/buttons/gradientLabelButton.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
RegExp regExps = new RegExp(pattern);

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      height: 80,
                      child: Image.asset("assets/logos/newsAppLogo.png")),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome To",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: ""),
                    ),
                    Text(
                      "NewsAPP+",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: ""),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      textColor: Colors.black,
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                            fontFamily: "",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GradientLabelButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  icon: Icons.email_outlined,
                  label: "Continue with Email",
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.black54,
                      Colors.black54,
                    ],
                  ),
                  labelColor: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                GradientLabelButton(
                  onPressed: () {},
                  icon: Icons.facebook,
                  label: "Continue with Facebook",
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xff4267B2),
                      Color(0xff4267B2),
                    ],
                  ),
                  labelColor: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                GradientLabelButton(
                  onPressed: () {
                    signInWithGoogle();
                  },
                  icon: Icons.g_mobiledata,
                  label: "Continue with Google",
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.redAccent,
                      Colors.redAccent,
                    ],
                  ),
                  labelColor: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Already have an account?",
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginWithEmailPage()));
                    },
                    textColor: Colors.black,
                    child: Text("Login"),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
