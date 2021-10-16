import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_plus/pages/login.dart';
import 'package:news_app_plus/services/auth.dart';
import 'package:news_app_plus/widgets/buttons/gradientLabelButton.dart';
import 'package:news_app_plus/widgets/textField/userDataField.dart';

class ProfilePage extends StatelessWidget {
  final userImage = FirebaseAuth.instance.currentUser!.photoURL;
  final userName = FirebaseAuth.instance.currentUser!.displayName;
  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              Center(
                child: Container(
                    height: 80,
                    child: Image.asset("assets/logos/newsAppLogo.png")),
              ),
              SizedBox(height: 40),
              Center(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "${userImage == null ? "https://cdn-icons-png.flaticon.com/512/64/64572.png" : userImage}"),
                      fit: BoxFit.fitHeight,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              UserDataField(
                  icon: Icons.account_circle_outlined,
                  titleText: "Username",
                  text: "${userName == null ? " " : userName}"),
              UserDataField(
                  icon: Icons.email_outlined,
                  titleText: "Email",
                  text: "${userEmail == null ? " " : userEmail}"),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 165,
                    child: GradientLabelButton(
                      onPressed: () async {
                        Logout();
                        await Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      icon: Icons.logout,
                      label: "Logout",
                      labelColor: Colors.white,
                      gradient: LinearGradient(
                        colors: <Color>[
                          Colors.black54,
                          Colors.black54,
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
