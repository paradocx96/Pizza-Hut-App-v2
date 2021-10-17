import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Cart/models/CartModel.dart';
import 'package:pizzahut/modules/Cart/screens/Cart.dart';
import 'package:pizzahut/modules/FoodMenu/screens/FoodMenu.dart';
import 'package:pizzahut/modules/Pizza/screens/PizzaSingleView.dart';
import 'package:pizzahut/modules/Search/screens/SearchPage.dart';
import 'package:pizzahut/modules/homepage/screens/TempGetStarted.dart';
import 'package:pizzahut/modules/homepage/screens/edit_profile/edit_profile.dart';
import 'package:pizzahut/modules/homepage/screens/view_profile/view_profile.dart';
import 'package:pizzahut/widgets/BottomNavBar.dart';
import 'package:pizzahut/widgets/PHAppBar.dart';
import 'package:pizzahut/widgets/BottomNavBar2.dart';
import 'package:pizzahut/modules/MainMenu/screens/MainMenu.dart';
import 'package:pizzahut/modules/Landing/screens/LandingPage.dart';
import 'package:pizzahut/modules/homepage/screens/Example.dart';
import 'package:provider/provider.dart';
import 'package:pizzahut/modules/contact/screens/contact.dart';

//import 'package:pizzahut/modules/homepage/screens/gets_started/gets_started_screen.dart';
import 'package:pizzahut/modules/homepage/screens/splash/splash_screen.dart';
import 'package:pizzahut/modules/homepage/screens/trace_order/view_trace_orders.dart';
import 'modules/homepage/models/authentication.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CartModel()),
    ChangeNotifierProvider.value(
      value: Authentication(),
    ),
  ], child: MyApp()));
}

const accentColor = Color(0xffEE3A43);
const secondaryColor = Color(0xffF1F1F1);
const canvasColor = Color(0xFFF4EFEF);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = true;

    return MaterialApp(
      title: 'Pizza Hut RHN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        accentColor: accentColor,
        canvasColor: canvasColor
      ),
      home: isLoggedIn ? SplashScreen() : HomePage(),
      routes: {
        FoodMenu.routeName: (context) => const FoodMenu(),
        LandingPage.routeName: (context) => const LandingPage(),
        PizzaSingleView.routeName: (context) => const PizzaSingleView(),
        Cart.routeName: (context) => const Cart(),
        SearchPage.routeName: (context) => const SearchPage(),
        Contact.routeName: (context) => const Contact(),
        ViewProfile.routeName: (context) =>  ViewProfile(),
        EditProfile.routeName: (context) => EditProfile()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int currentIndex = 0;

  final screens = [
    Center(
      child: Text("Home"),
    ),
    MainMenu(),
    Center(
      child: Text("Track Order"),
    ),
    Center(
      child: Text("Profile"),
    ),
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();

    /*Widget pizzaHutLogo_image = Container(
      height: 50,
      child: Image.asset("images/pizza_hut_logo.png"),
    );

    return Scaffold(
      appBar: AppBar(
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
      ),
      body: screens[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.search),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          iconSize: 40,
          selectedFontSize: 15,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index) ,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, color: Colors.black,),
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
          ])
    );*/
  }
}
