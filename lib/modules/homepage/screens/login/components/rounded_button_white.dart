import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class RoundedButtonWhite extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final IconData icon;

  const RoundedButtonWhite({
    Key? key,
    required this.text,
    required this.press,
    this.color = Colors.white,
    this.icon = Icons.g_translate,
    this.textColor = Colors.black54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      height: size.height * 0.085,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.red,
            width: 1.8,

          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(1),
              spreadRadius: 0.1,
              blurRadius: 0,
              offset: Offset(0, 0),// changes position of shadow
            ),
          ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    // return ElevatedButton(
    //   child: Text(
    //     text,
    //     style: TextStyle(color: textColor),
    //   ),
    //   onPressed: press,
    //   style: ElevatedButton.styleFrom(
    //       primary: color,
    //       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    //       textStyle: TextStyle(
    //           color: textColor, fontSize: 16, fontWeight: FontWeight.w700)),
    // );
    return SignInButton(
      Buttons.Google,
      text: "Sign in with Google",
      onPressed: () {},
    );
  }
}