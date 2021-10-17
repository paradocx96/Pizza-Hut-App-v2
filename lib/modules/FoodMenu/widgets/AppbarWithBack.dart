import 'package:flutter/material.dart';

class AppbarWithBack extends StatefulWidget {
  const AppbarWithBack({Key? key}) : super(key: key);

  @override
  _AppbarWithBackState createState() => _AppbarWithBackState();
}

class _AppbarWithBackState extends State<AppbarWithBack> {
  @override
  Widget build(BuildContext context) {

    //pizza hut logo for the app bar
    Widget pizzaHutLogo_image = Container(
      height: 50,
      child: Image.asset("images/pizza_hut_logo.png"),
    );
    return AppBar(
      title: pizzaHutLogo_image,
      leading: IconButton(
        icon: Icon(Icons.navigate_before_sharp),
        onPressed: (){},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.delivery_dining),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: (){},
        ),
      ],
    );
  }
}
