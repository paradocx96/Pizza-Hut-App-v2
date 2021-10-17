import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pizzahut/modules/homepage/screens/login/components/forgot_password_check.dart';

import '../login_screen.dart';

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
              left: 0,
              child: Image.asset(
                "assets/images/login_page/pizza_login_page.png",
                width: size.width * 1,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/login_page/ingrediants_login_page.png",
                width: size.width * 1,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/login_page/login_top_design.png",
                width: size.width * 1,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 20,
              child: Image.asset(
                "assets/images/login_page/login_bottom_design.jpg",
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
