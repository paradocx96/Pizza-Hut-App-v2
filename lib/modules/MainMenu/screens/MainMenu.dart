import 'package:flutter/material.dart';
import 'package:pizzahut/modules/FoodMenu/routes/FoodMenuArguments.dart';
import 'package:pizzahut/modules/FoodMenu/screens/FoodMenu.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  //Color secondaryColor = Color(0xffF1F1F1);
  Color pastaColor = Color(0xffFFC1C1);
  Color pizzaColor = Color(0xffFFDEAD);
  Color appetizerColor = Color(0xffFFFDCB);
  Color desertColor = Color(0xffFCDFFF);
  Color beveragesColor = Color(0xffDCFFDF);
  Color promosColor = Color(0xffE7EFFF);
  @override
  Widget build(BuildContext context) {
    Widget pizzaImage = Container(
      //color: Theme.of(context).canvasColor,
      height: 90,
      width: 90,
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset("images/pizza_main.jpg")),
    );

    Widget pastaImage = Container(
      height: 90,
      width: 90,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Image.asset("images/pasta_main.jpg"),
      ),
    );

    Widget appetizerImage = Container(
      height: 90,
      width: 90,
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset("images/cheesy_garlic_bread_main.jpg")),
    );

    Widget desertImage = Container(
      height: 90,
      width: 90,
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset("images/lava_cake_main.jpg")),
    );

    Widget beveragesImage = Container(
      height: 90,
      width: 90,
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset("images/chocolate_milkshake_main.jpg")),
    );

    Widget promoImage = Container(
      height: 90,
      width: 90,
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset("images/promo_main.jpg")),
    );

    return Container(
      //color: secondaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 175,
                  width: 175,
                  margin: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, FoodMenu.routeName,
                          arguments: FoodMenuArguments(0) //navigate to pizza
                          );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: pizzaColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Center(
                              child: pizzaImage,
                            ),
                            Center(
                              child: Text(
                                "Pizza",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 175,
                  width: 175,
                  margin: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, FoodMenu.routeName,
                          arguments: FoodMenuArguments(1) //navigate to pasta
                          );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: pastaColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Center(
                              child: pastaImage,
                            ),
                            Center(
                              child: Text(
                                "Pasta",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 175,
                  width: 175,
                  margin: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, FoodMenu.routeName,
                          arguments:
                              FoodMenuArguments(2) //navigate to appetizer
                          );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: appetizerColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Center(
                              child: appetizerImage,
                            ),
                            Center(
                              child: Text(
                                "Appetizer",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 175,
                  width: 175,
                  margin: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, FoodMenu.routeName,
                          arguments: FoodMenuArguments(3) //navigate to desert
                          );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: desertColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Center(
                              child: desertImage,
                            ),
                            Center(
                              child: Text(
                                "Desert",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 175,
                  width: 175,
                  margin: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, FoodMenu.routeName,
                          arguments:
                              FoodMenuArguments(4) //navigate to beverages
                          );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: beveragesColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Center(
                              child: beveragesImage,
                            ),
                            Center(
                              child: Text(
                                "Beverages",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 175,
                  width: 175,
                  margin: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, FoodMenu.routeName,
                          arguments: FoodMenuArguments(5) //navigate to promos
                          );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: promosColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Center(
                              child: promoImage,
                            ),
                            Center(
                              child: Text(
                                "Promos",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
