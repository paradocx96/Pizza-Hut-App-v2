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
              "assets/images/gets_started_page/gets_started_page_background.png",
              width: size.width * 1,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/gets_started_page/pizza_3.png",
              width: size.width * 0.8,
            ),
          ),
          Positioned(
            top: 0,
            left: 20,
            child: Image.asset(
              "assets/images/gets_started_page/cocacola.png",
              width: size.width * 0.8,
            ),
          ),
          Positioned(
            bottom: 0.3,
            left: 20,
            child: Image.asset(
              "assets/images/gets_started_page/quote.png",
              width: size.width * 0.95,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
