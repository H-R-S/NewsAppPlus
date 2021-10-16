import 'package:flutter/material.dart';
import 'package:news_app_plus/pages/loginWithEmail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app_plus/widgets/buttons/raisedGradientButton.dart';
import 'package:news_app_plus/widgets/textField/myTextField.dart';
import 'package:news_app_plus/widgets/textField/textFieldTag.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
RegExp regExps = new RegExp(pattern);

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool passHide = true;
  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    // Future send() async {
    //   try {
    //     UserCredential userCredential =
    //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //       email: emailController.text,
    //       password: passwordController.text,
    //     );
    //     print("Successfully User Created");

    //     // Send Data To Firestore
    //     await FirebaseFirestore.instance
    //         .collection("users")
    //         .doc(userCredential.user!.uid)
    //         .set({
    //       "username": usernameController.text.trim(),
    //       "email": emailController.text.trim(),
    //       "password": passwordController.text.trim(),
    //       "uid": userCredential.user!.uid,
    //     });
    //     // Clear TextField
    //     usernameController.clear();
    //     emailController.clear();
    //     passwordController.clear();
    //     // Navigate to Login Screen
    //     Navigator.of(context).pushNamed("/login");

    //     setState(() {
    //       isChange = false;
    //     });
    //     print("Successfully Data Added in Database");
    //   } on FirebaseException catch (e) {
    //     if (e.code == 'weak-password') {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           content: Text("The password provided is too weak."),
    //         ),
    //       );
    //       print("'weak-password' ==> The password provided is too weak.");
    //     } else if (e.code == 'email-already-in-use') {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //             content: Text("The account already exists for that email.")),
    //       );
    //       print(
    //           "'email-already-in-use' ==>The account already exists for that email.");
    //     }
    //   } catch (e) {
    //     print("error ==> $e");
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text("$e")));
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
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Please Enter Username";
                    } else if (value.length < 3) {
                      return "Username is too short";
                    }
                  },
                  hint: "Enter username",
                  controller: usernameController,
                  inputType: TextInputType.emailAddress,
                  isPassword: false,
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
                      return "Password is less than 8 characters";
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
                      onPressed: () {},
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Already have an account?",
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginWithEmailPage()));
                    },
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

  // Future<void> signUpWithMail() async {
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             content: Text('Success sign up'),
  //           );
  //         });
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message);
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             content: Text(e.message!),
  //           );
  //         });
  //   }
}
