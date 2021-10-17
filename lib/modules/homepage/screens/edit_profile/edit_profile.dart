import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/homepage/screens/edit_profile/components/body.dart';

class EditProfile extends StatelessWidget {
  static const routeName = "/profile/editProfile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}