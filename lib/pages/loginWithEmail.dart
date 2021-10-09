import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_plus/pages/signUp.dart';
import 'package:news_app_plus/widgets/buttons/raisedGradientButton.dart';
import 'package:news_app_plus/widgets/textField/myTextField.dart';
import 'package:news_app_plus/widgets/textField/textFieldTag.dart';

class LoginWithEmailPage extends StatefulWidget {
  @override
  _LoginWithEmailPageState createState() => _LoginWithEmailPageState();
}

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
RegExp regExps = new RegExp(pattern);

class _LoginWithEmailPageState extends State<LoginWithEmailPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool passHide = true;
  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    // login() async {
    //   print("ready");
    //   try {
    //      userCredential =
    //         await FirebaseAuth.instance.signInWithEmailAndPassword(
    //       email: emailController.text.trim(),
    //       password: passwordController.text.trim(),
    //     );
    //     emailController.clear();
    //     passwordController.clear();
    //     print("Successfully Login ==> $userCredential");

    //     Navigator.of(context).pushReplacementNamed("/home");
    //     setState(() {
    //       isChange = false;
    //     });
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'user-not-found') {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(content: Text("No user found for that email.")));
    //       print('No user found for that email.');
    //     } else if (e.code == 'wrong-password') {
    //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //           content: Text('Wrong password provided for that user.')));
    //       print('Wrong password provided for that user.');
    //     }
    //   }
    // }

    void validation() {
      final _form = _formKey.currentState;
      if (_form!.validate()) {
        // login();
      } else {
        print("no");
        setState(() {
          isChange = false;
        });
      }
    }

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
            child: Form(
              key: _formKey,
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
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please Enter Email Address";
                      } else if (!regExp.hasMatch(value)) {
                        return "Email is Invalid";
                      }
                    },
                    hint: "Enter email address",
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    isPassword: false,
                  ),
                  TextFieldTag(text: "Password"),
                  MyTextField(
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please Enter Password";
                      } else if (value.length < 8) {
                        return "Password is less than 8";
                      }
                    },
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
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
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
                          validation();
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
      ),
    );
  }
}
