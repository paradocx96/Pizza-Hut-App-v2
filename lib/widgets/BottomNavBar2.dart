import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Landing/routes/LandingPageArguments.dart';
import 'package:pizzahut/modules/Landing/screens/LandingPage.dart';

class BottomNavBar2 extends StatefulWidget {
  const BottomNavBar2({Key? key}) : super(key: key);

  @override
  _BottomNavBar2State createState() => _BottomNavBar2State();
}

class _BottomNavBar2State extends State<BottomNavBar2> {
  int currentIndex = 0;

  final screens = [
    Center(child: Text("Home"),),
    Center(child: Text("Menu"),),
    Center(child: Text("Track Order"),),
    Center(child: Text("Profile"),),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).accentColor,
      backgroundColor: Theme.of(context).primaryColor,
      type: BottomNavigationBarType.fixed,
      iconSize: 40,
      selectedFontSize: 15,
      currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index) ,
        items: [
      BottomNavigationBarItem(
        icon: GestureDetector( onTap: () {
          Navigator.pushNamed(context, LandingPage.routeName,
              arguments: LandingPageArguments(0) //navigate to promos
          );
        },
            child: Icon(Icons.home_filled, color: Colors.black,)),
        label: 'Home',
        backgroundColor: Theme.of(context).primaryColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.menu_book, color: Colors.black,),
        label: 'Menu',
        backgroundColor: Theme.of(context).primaryColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.delivery_dining, color: Colors.black,),
        label: 'Order Tracking',
        backgroundColor: Theme.of(context).primaryColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.menu, color: Colors.black,),
        label: 'More',
        backgroundColor: Theme.of(context).primaryColor,
      )
    ]);
  }
}
