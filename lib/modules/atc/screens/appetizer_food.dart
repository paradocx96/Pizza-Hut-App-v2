import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Cart/models/CartItem.dart';
import 'package:pizzahut/modules/Cart/models/CartModel.dart';
import 'package:pizzahut/modules/homepage/screens/view_addresses/view_addresses.dart';
import 'package:provider/provider.dart';

class AppetizerFood extends StatefulWidget {
  final String name;
  final List size;
  final List price;
  final String description;
  final String type;
  final String flag;

  const AppetizerFood(
      {Key? key,
      required this.name,
      required this.size,
      required this.price,
      required this.description,
      required this.type,
      required this.flag})
      : super(key: key);

  @override
  _AppetizerFoodState createState() => _AppetizerFoodState();
}

class _AppetizerFoodState extends State<AppetizerFood> {
  @override
  Widget build(BuildContext context) {
    //image for the pizza hut logo
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
            onPressed: () {},
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
                'assets/images/appetizers/${widget.flag}',
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

  int quantity = 1;
  int totalPrice = 0;
  int unitPrice = 0;
  String typeSelected = 'none';
  String qtySelected = 'none';
  late ButtonStyle _buttonStyleOne = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFECE00)));
  late ButtonStyle _buttonStyleTwo = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFECE00)));
  late ButtonStyle _buttonStyleThree = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFECE00)));

  void _incrementQuantity() {
    if (quantity < 5) {
      setState(() {
        quantity++;
        setState(() {
          totalPrice = unitPrice * quantity;
        });
      });
    }
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        setState(() {
          totalPrice = unitPrice * quantity;
        });
      });
    }
  }

  void _priceCalculator(int val) {
    unitPrice = val;
    setState(() {
      totalPrice = unitPrice * quantity;
    });
  }

  void _buttonColorChanger(String val) {
    if (val == 'one') {
      setState(() {
        _buttonStyleOne = ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.redAccent));
        _buttonStyleTwo = ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFFECE00)));
        _buttonStyleThree = ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFFECE00)));
      });
    } else if (val == 'two') {
      setState(() {
        _buttonStyleOne = ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFFECE00)));
        _buttonStyleTwo = ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.redAccent));
        _buttonStyleThree = ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFFECE00)));
      });
    } else if (val == 'three') {
      setState(() {
        _buttonStyleOne = ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFFECE00)));
        _buttonStyleTwo = ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFFECE00)));
        _buttonStyleThree = ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.redAccent));
      });
    }
  }

  void _setTypeSelected(String val) {
    setState(() {
      typeSelected = val;
    });
  }

  void _setQtySelected(String val) {
    setState(() {
      qtySelected = val;
    });
  }

  void _addToCart() {
    if (totalPrice != 0) {
      if (typeSelected == 'advanced') {
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
            qtySelected));
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
      } else {
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
      }
    }
  }

  Widget typeCheck() {
    if (widget.type == 'advanced') {
      _setTypeSelected(widget.type);
      return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
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
                  style: TextStyle(
                      height: 1.5, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      style: _buttonStyleOne,
                      onPressed: () {
                        _priceCalculator(widget.price[0].toInt());
                        _setQtySelected(widget.size[0]);
                        _buttonColorChanger('one');
                      },
                      child: Text(
                        widget.size[0] + '\nRs.' + widget.price[0].toString(),
                        style: TextStyle(
                            height: 1.2, fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      style: _buttonStyleTwo,
                      onPressed: () {
                        _priceCalculator(widget.price[1].toInt());
                        _setQtySelected(widget.size[1]);
                        _buttonColorChanger('two');
                      },
                      child: Text(
                        widget.size[1] + '\nRs.' + widget.price[1].toString(),
                        style: TextStyle(
                            height: 1.2, fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      style: _buttonStyleThree,
                      onPressed: () {
                        _priceCalculator(widget.price[2].toInt());
                        _setQtySelected(widget.size[2]);
                        _buttonColorChanger('three');
                      },
                      child: Text(
                        widget.size[2] + '\nRs.' + widget.price[2].toString(),
                        style: TextStyle(
                            height: 1.2, fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      _setTypeSelected(widget.type);
      _priceCalculator(widget.price[0].toInt());
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
            style: TextStyle(
                height: 1.5, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
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
