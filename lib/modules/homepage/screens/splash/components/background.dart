import 'package:flutter/material.dart';

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
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            child: Image.asset(
              "assets/images/splash_page/splash_page_design.png",
              width: size.width * 1,
            ),
          ),
          Positioned(
            child: Image.asset(
              "assets/images/splash_page/pizza_hut_log_splash.png",
              width: size.width * 0.8,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/splash_page/pizza_1.png",
              width: size.width * 0.8,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/splash_page/pizza_2.png",
              width: size.width * 0.8,
            ),
          ),
          Positioned(
            top: 0,
            left: 0.2,
            child: Image.asset(
              "assets/images/splash_page/ingredients_1.png",
              width: size.width * 0.8,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0.2,
            child: Image.asset(
              "assets/images/splash_page/ingredients_2.png",
              width: size.width * 0.8,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
