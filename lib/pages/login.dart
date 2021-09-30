import 'package:flutter/material.dart';
import 'package:news_app_plus/pages/home.dart';
import 'package:news_app_plus/pages/loginWithEmail.dart';
import 'package:news_app_plus/pages/signUp.dart';
import 'package:news_app_plus/widgets/gradientLabelButton.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
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
                  onPressed: () {},
                  icon: Icons.g_mobiledata,
                  label: "Continue with Google",
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                  labelColor: Colors.black,
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
