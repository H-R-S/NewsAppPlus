import 'package:flutter/material.dart';
import 'package:news_app_plus/pages/loginWithEmail.dart';
import 'package:news_app_plus/widgets/myTextField.dart';
import 'package:news_app_plus/widgets/raisedGradientButton.dart';
import 'package:news_app_plus/widgets/textFieldTag.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = new TextEditingController();
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
                TextFieldTag(text: "Username"),
                MyTextField(
                  hint: "Enter username",
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  isPassword: false,
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
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          onPressed: () {},
                          textColor: Color(0xff02645f),
                          child: Text('Forgot Password?'),
                        ),
                      ],
                    ),
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
                        "SignUp",
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginWithEmailPage()));
                      },
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Already have an acc?",
                  ),
                  FlatButton(
                    onPressed: () {},
                    textColor: Color(0xff02645f),
                    child: Text(
                      "Login",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
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
