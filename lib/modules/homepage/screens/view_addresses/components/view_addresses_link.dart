import 'package:flutter/material.dart';

class ViewAddressesLink extends StatelessWidget {
  final VoidCallback press;
  const ViewAddressesLink({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Text(
        //   login ? "Forgot Password ? " : "Already have an Account ? ",
        //   style: TextStyle(color: Colors.black54),
        // ),
        GestureDetector(
          onTap: press,
          child: Text(
             "View All",
              style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
