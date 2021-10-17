
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/homepage/screens/gets_started/components/rounded_button.dart';
import 'package:pizzahut/modules/homepage/screens/login/login_screen.dart';
//import 'package:pizzahut/modules/homepage/screens/gets_started/gets_started_screen.dart';
//import 'package:pizzahut/modules/homepage/screens/splash/splash_screen.dart';


import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height: size.height * 0.05),
            // Text(
            //   "FOR THE LOVE OF THE PIZZA",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: size.height * 0.8),
            RoundedButton(
              text: "Get Started",
              press: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return LoginScreen();
                //     },
                //   ),
                // );

                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
