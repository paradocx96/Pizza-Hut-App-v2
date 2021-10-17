import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Cart/screens/Cart.dart';
import 'package:pizzahut/modules/FoodMenu/routes/FoodMenuArguments.dart';
import 'package:pizzahut/modules/FoodMenu/widgets/AppbarWithBack.dart';
import 'package:pizzahut/modules/FoodMenu/widgets/SlidableMenuItem.dart';
import 'package:pizzahut/modules/Pizza/screens/PizzaMenu.dart';
import 'package:pizzahut/modules/Pizza/screens/PizzaMenu2.dart';
import 'package:pizzahut/modules/categories/screens/appetizers.dart';
import 'package:pizzahut/modules/categories/screens/beverages.dart';
import 'package:pizzahut/modules/categories/screens/desserts.dart';
import 'package:pizzahut/modules/categories/screens/pastas.dart';
import 'package:pizzahut/modules/homepage/screens/view_addresses/view_addresses.dart';
import 'package:pizzahut/modules/promos/screens/promos.dart';

class FoodMenu extends StatefulWidget {
  const FoodMenu({Key? key}) : super(key: key);

  static const routeName = "/menus/foodMenu";

  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> with SingleTickerProviderStateMixin{

  //TabController _controller = TabController(length: 3, vsync: this);

  /*@override
  void initState() {

    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }*/


  @override
  Widget build(BuildContext context) {
    //extract the arguments of the previous page
    final args = ModalRoute.of(context)!.settings.arguments as FoodMenuArguments;
    const double tabbarContainerHeight = 100;

    //image for the pizza hut logo
    Widget pizzaHutLogo_image = Container(
      height: 50,
      child: Image.asset("images/pizza_hut_logo.png"),
    );

    return DefaultTabController(
      initialIndex: args.foodType,
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: pizzaHutLogo_image,
          leading: IconButton(
            icon: Icon(Icons.navigate_before_sharp),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.delivery_dining),
              onPressed: (){


                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context){
                      return CupertinoAlertDialog(
                        title: const Text("Need to change deliver address?"),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text("Your order will be delivered "),
                              Text("211/G Niwandama south ja-ela?",style: TextStyle( decoration: TextDecoration.underline, color: Colors.redAccent),),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Keep")),
                          TextButton(
                              onPressed: () {
                                //Navigator.of(context).pop();
                                //Navigator.pushNamed(context, ViewAddresses.routeName);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ViewAddresses()));
                              },
                              child: const Text("Change"))
                        ],
                      );
                    });


              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                Navigator.pushNamed(context, Cart.routeName,

                );
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: new Size(tabbarContainerHeight, tabbarContainerHeight),
            child: Container(
              child: TabBar(
                //controller:  _controller,
                //indicatorSize: TabBarIndicatorSize.values,
                isScrollable: true,
                tabs: [
                  Container(height: tabbarContainerHeight, child: Tab(child: SlidableMenuItem("pizza"))),
                  Container(height: tabbarContainerHeight,child: Tab(child: SlidableMenuItem("pasta"))),
                  Container(height: tabbarContainerHeight,child: Tab(child: SlidableMenuItem("appetizer"))),
                  Container(height: tabbarContainerHeight,child: Tab(child: SlidableMenuItem("desert"))),
                  Container(height: tabbarContainerHeight,child: Tab(child: SlidableMenuItem("beverages"))),
                  Container(height: tabbarContainerHeight,child: Tab(child: SlidableMenuItem("promo"))),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView( children: [
          PizzaMenu2(),
          Pastas(),
          Appetizers(),
          Desserts(),
          Beverages(),
          Promos(),
        ],
        ),
      ),
    );
  }
}
