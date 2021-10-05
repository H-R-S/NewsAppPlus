import 'package:flutter/material.dart';
import 'package:news_app_plus/pages/home.dart';
import 'package:news_app_plus/pages/signUp.dart';
import 'package:news_app_plus/widgets/buttons/raisedGradientButton.dart';
import 'package:news_app_plus/widgets/textField/myTextField.dart';
import 'package:news_app_plus/widgets/textField/textFieldTag.dart';

class LoginWithEmailPage extends StatefulWidget {
  @override
  _LoginWithEmailPageState createState() => _LoginWithEmailPageState();
}

class _LoginWithEmailPageState extends State<LoginWithEmailPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: Container(
                      height: 80,
                      child: Image.asset("assets/logos/newsAppLogo.png")),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFieldTag(text: "Email"),
                MyTextField(
                  hint: "Enter email address",
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  isPassword: false,
                ),
                TextFieldTag(text: "Password"),
                MyTextField(
                  hint: "Enter password",
                  controller: passwordController,
                  inputType: TextInputType.text,
                  isPassword: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text(
                          "Not a member?",
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          textColor: Color(0xff02645f),
                          child: Text(
                            "Signup",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ]),
                      FlatButton(
                        onPressed: () {},
                        textColor: Color(0xff02645f),
                        child: Text('Forgot Password?'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 300,
                    height: 50,
                    child: RaisedGradientButton(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Colors.black54,
                          Colors.black54,
                        ],
                      ),
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomePage()));
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
