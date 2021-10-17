import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Landing/routes/LandingPageArguments.dart';
import 'package:pizzahut/modules/Landing/screens/LandingPage.dart';

class TempGetStarted extends StatelessWidget {
  const TempGetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, LandingPage.routeName,
                arguments: LandingPageArguments(1) //navigate to landing page
            );
          },
          child: Card(
            child: Text("Get started"),
          ),
        ),
      ),
    );
  }
}
