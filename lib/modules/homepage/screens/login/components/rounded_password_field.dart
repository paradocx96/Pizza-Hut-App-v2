import 'package:flutter/material.dart';
import 'package:pizzahut/modules/homepage/screens/login/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    bool isObscurePassword = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Colors.black54,
          ),
          suffixIcon:
          IconButton (
            icon: Icon(Icons.visibility, color: Colors.black54),
            onPressed: () {
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
