import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpButtonWhite extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;

  const SignUpButtonWhite({
    Key? key,
    required this.text,
    required this.press,
    this.color = Colors.white,
    this.textColor = Colors.redAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.red,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 0.1,
            blurRadius: 8,
            offset: Offset(0, 9), // changes position of shadow
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
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          textStyle: TextStyle(
              color: textColor, fontSize: 15, fontWeight: FontWeight.w700)),
    );
  }
}