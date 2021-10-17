import 'package:flutter/material.dart';

class PHAppBar extends StatefulWidget {
  const PHAppBar({Key? key}) : super(key: key);

  @override
  _PHAppBarState createState() => _PHAppBarState();
}

class _PHAppBarState extends State<PHAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(

      title: Image.asset("images/pizza_hut_logo.png"),
    );
  }
}
