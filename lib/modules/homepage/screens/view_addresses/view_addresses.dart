import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/homepage/screens/view_addresses/components/body.dart';

class ViewAddresses extends StatelessWidget {
  const ViewAddresses({Key? key}) : super(key: key);
  static const routeName = "/address/viewAddress";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
