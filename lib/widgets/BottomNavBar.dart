import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: BottomAppBar(
          elevation: 10,
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
                color: Colors.black,
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu_book),
                color: Colors.black,
              ),
              Spacer(),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delivery_dining),
                color: Colors.black,
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
                color: Colors.black,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
