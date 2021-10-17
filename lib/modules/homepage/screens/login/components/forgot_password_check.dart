import 'package:flutter/material.dart';

class ForgotPasswordCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const ForgotPasswordCheck({
    Key? key,
    this.login = true,
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
            login ? "Forgot Password ?" : "",
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
