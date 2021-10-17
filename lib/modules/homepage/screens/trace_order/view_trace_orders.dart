import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './components/body.dart';

class ViewTraceOrders extends StatelessWidget {
  const ViewTraceOrders({Key? key}) : super(key: key);

  static const routeName = "/orderTracking";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
