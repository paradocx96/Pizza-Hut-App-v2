import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Cart/models/CartItem.dart';
import 'package:pizzahut/modules/Cart/models/CartModel.dart';
import 'package:pizzahut/modules/Cart/screens/Cart.dart';
import 'package:pizzahut/modules/homepage/screens/view_addresses/view_addresses.dart';
import 'package:provider/provider.dart';

class NormalFood extends StatefulWidget {
  final String name;
  final int price;
  final String description;
  final String flag;

  const NormalFood(
      {Key? key,
      required this.name,
      required this.price,
      required this.description,
      required this.flag})
      : super(key: key);

  @override
  _NormalFoodState createState() => _NormalFoodState();
}

class _NormalFoodState extends State<NormalFood> {
  @override
  Widget build(BuildContext context) {
    Widget pizzaHutLogo_image = Container(
      height: 50,
      child: Image.asset("images/pizza_hut_logo.png"),
    );

    return Scaffold(
      appBar: AppBar(
        title: pizzaHutLogo_image,
        leading: IconButton(
          icon: Icon(Icons.navigate_before_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delivery_dining),
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text("Need to change deliver address?"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text("Your order will be delivered "),
                            Text(
                              "211/G Niwandama south ja-ela?",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.redAccent),
                            ),
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ViewAddresses()));
                            },
                            child: const Text("Change"))
                      ],
                    );
                  });
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(
                context,
                Cart.routeName,
              );
            },
          ),
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Color(0xFFF4EFEF)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: 250,
              height: 200,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      15.0, // Move to right 10  horizontally
                      15.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
              ),
              child: Image.asset(
                widget.flag,
                alignment: Alignment.center,
              ),
            ),
            Container(
              child: getDescription(),
            ),
            Container(
              child: typeCheck(),
            ),
            Container(
              child: addCart(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getDescription() {
    return Container(
      constraints: BoxConstraints(minHeight: 120, maxHeight: 135),
      margin: EdgeInsets.all(10.0),
      width: 340,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 25.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              15.0, // Move to right 10  horizontally
              15.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            child: Text(
              widget.name,
              style: TextStyle(
                  height: 2, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Text(
              widget.description,
              style: TextStyle(height: 1.2, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  int totalPrice = 0;
  int unitPrice = 0;
  int quantity = 1;

  void _incrementQuantity() {
    if (quantity < 5) {
      setState(() {
        quantity++;
      });
    }
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void _priceCalculator() {
    unitPrice = widget.price;
    totalPrice = unitPrice * quantity;
  }

  Widget typeCheck() {
    _priceCalculator();
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Text(
          'Rs.' + totalPrice.toString() + '.00',
          style:
              TextStyle(height: 1.5, fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _addToCart() {
    Provider.of<CartModel>(context, listen: false).add(CartItem(
        "Another",
        widget.name,
        totalPrice,
        quantity,
        "none",
        "none",
        "none",
        "none",
        "none",
        "none"));
  }

  Widget addCart() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).accentColor),
                    ),
                    onPressed: () {
                      _decrementQuantity();
                      _priceCalculator();
                    },
                    child: Text(
                      '-',
                      style: TextStyle(
                          height: 1, fontSize: 30, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: 165,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: -12.0,
                        blurRadius: 12.0,
                      )
                    ],
                  ),
                  child: Text(
                    quantity.toString(),
                    style: TextStyle(
                        height: 1.5, fontSize: 20, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).accentColor),
                    ),
                    onPressed: () {
                      _incrementQuantity();
                      _priceCalculator();
                    },
                    child: Text(
                      '+',
                      style: TextStyle(
                          height: 1, fontSize: 25, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 335,
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                _addToCart();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: const Text("Added to cart"),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add To Cart',
                    style: TextStyle(height: 1, fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 24.0,
                      semanticLabel: 'Add To Cart',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
