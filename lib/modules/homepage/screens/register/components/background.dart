import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pizzahut/modules/homepage/screens/register/components/signin_button_red.dart';
import 'package:pizzahut/modules/homepage/screens/register/components/signup_button_white.dart';
import 'package:pizzahut/modules/homepage/screens/login/login_screen.dart';

import '../register_screen.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      decoration: new BoxDecoration(
          color: Color.fromARGB(20, 209, 207, 207)
      ),
      //This is added for handle the background items
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/register_page/pizza_register_page.png",
                width: size.width * 1,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/register_page/ingrediants_register_page.png",
                width: size.width * 1,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/register_page/register_top_design.png",
                width: size.width * 1,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 20,
              child: Image.asset(
                "assets/images/register_page/register_bottom_design.png",
                width: size.width * 1,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
