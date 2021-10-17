import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/homepage/screens/view_profile/components/body.dart';

class ViewProfile extends StatelessWidget {

  static const routeName = "/profile/viewProfile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}