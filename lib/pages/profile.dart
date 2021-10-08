import 'package:flutter/material.dart';
import 'package:news_app_plus/widgets/buttons/gradientLabelButton.dart';
import 'package:news_app_plus/widgets/textField/userDataField.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
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
                    // image: DecorationImage(
                    //   image: NetworkImage("${data['photoUrl'] ==
                    //           null
                    //       ? "https://cdn-icons-png.flaticon.com/512/64/64572.png"
                    //       : data['photoUrl']}"),
                    //   fit: BoxFit.fitHeight,
                    // ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              UserDataField(
                  icon: Icons.account_circle_outlined,
                  titleText: "Username",
                  text: ""),
              UserDataField(
                  icon: Icons.email_outlined, titleText: "Email", text: ""),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 165,
                    child: GradientLabelButton(
                      onPressed: () {},
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
