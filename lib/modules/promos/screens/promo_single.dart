import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/constants/Constants.dart';
import 'package:pizzahut/modules/Cart/models/CartItem.dart';
import 'package:pizzahut/modules/Cart/models/CartModel.dart';
import 'package:pizzahut/modules/Cart/screens/Cart.dart';
import 'package:pizzahut/modules/homepage/screens/view_addresses/view_addresses.dart';
import 'package:pizzahut/modules/promos/widgets/custom_select_eight.dart';
import 'package:pizzahut/modules/promos/widgets/custom_select_five.dart';
import 'package:pizzahut/modules/promos/widgets/custom_select_four.dart';
import 'package:pizzahut/modules/promos/widgets/custom_select_nine.dart';
import 'package:pizzahut/modules/promos/widgets/custom_select_one.dart';
import 'package:pizzahut/modules/promos/widgets/custom_select_seven.dart';
import 'package:pizzahut/modules/promos/widgets/custom_select_six.dart';
import 'package:pizzahut/modules/promos/widgets/custom_select_three.dart';
import 'package:pizzahut/modules/promos/widgets/custom_select_two.dart';
import 'package:provider/provider.dart';

class PromoSingle extends StatefulWidget {
  final String name;
  final int price;
  final String description;
  final String flag;
  final String type;

  const PromoSingle(
      {Key? key,
      required this.name,
      required this.price,
      required this.description,
      required this.flag,
      required this.type})
      : super(key: key);

  @override
  _PromoSingleState createState() => _PromoSingleState();
}

class _PromoSingleState extends State<PromoSingle> {
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: getImage(),
            ),
            Container(
              child: getDescription(),
            ),
            Container(
              child: getOptions(),
            ),
            Container(
              child: getAddToCart(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImage() {
    return Container(
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
    );
  }

  int totalPrice = 0;
  int unitPrice = 0;
  int quantity = 1;
  int currentIndex = 0;

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

  void _addToCart() {
    if (totalPrice != 0) {
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

  Widget getDescription() {
    _priceCalculator();
    return Container(
      constraints: BoxConstraints(minHeight: 120, maxHeight: 150),
      margin: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
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
              style: TextStyle(height: 1.2, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Text(
              'Rs.' + totalPrice.toString() + '.00',
              style: TextStyle(
                  height: 1.2, fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget getOptions() {
    List<BottomNavigationBarItem> typeSelected = [
      BottomNavigationBarItem(
        icon: Text(''),
        label: '',
        backgroundColor: Theme.of(context).primaryColor,
      ),
    ];

    if (widget.type == '1') {
      typeSelected = [
        BottomNavigationBarItem(
          icon: Text(''),
          label: '1ST OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '2ND OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '3RD OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ];
    } else if (widget.type == '2') {
      typeSelected = [
        BottomNavigationBarItem(
          icon: Text(''),
          label: '1ST OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '2ND OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '3RD OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '4TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ];
    } else if (widget.type == '3') {
      typeSelected = [
        BottomNavigationBarItem(
          icon: Text(''),
          label: '1ST OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '2ND OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '3RD OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '4TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ];
    } else if (widget.type == '4') {
      typeSelected = [
        BottomNavigationBarItem(
          icon: Text(''),
          label: '1ST OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '2ND OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ];
    } else if (widget.type == '5') {
      typeSelected = [
        BottomNavigationBarItem(
          icon: Text(''),
          label: '1ST OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '2ND OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ];
    } else if (widget.type == '6') {
      typeSelected = [
        BottomNavigationBarItem(
          icon: Text(''),
          label: '1ST OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '2ND OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '3RD OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '4TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ];
    } else if (widget.type == '7') {
      typeSelected = [
        BottomNavigationBarItem(
          icon: Text(''),
          label: '1ST OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '2ND OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '3RD OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '4TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '5TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '6TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '7TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '8TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '9TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ];
    } else if (widget.type == '8') {
      typeSelected = [
        BottomNavigationBarItem(
          icon: Text(''),
          label: '1ST OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '2ND OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '3RD OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '4TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '5TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '6TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '7TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '8TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Text(''),
          label: '9TH OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ];
    } else {
      typeSelected = [
        BottomNavigationBarItem(
          icon: Text(''),
          label: '1ST OPTION',
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ];
    }

    return Container(
      child: Column(
        children: [
          Container(
            child: BottomNavigationBar(
                selectedItemColor: Theme.of(context).accentColor,
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                iconSize: 40,
                selectedFontSize: 20,
                unselectedFontSize: 15,
                currentIndex: currentIndex,
                //currentIndex: args.navbarIndex,
                onTap: (index) => setState(() => currentIndex = index),
                items: typeSelected),
          ),
          Container(
            child: getOptionView(),
          ),
        ],
      ),
    );
  }

  Widget getOptionView() {
    if (widget.type == '1') {
      return Container(
        child: currentIndex == 0
            ? CustomSelectOne(list: Constants.promoPizzasListOne)
            : currentIndex == 1
                ? CustomSelectTwo(list: Constants.promoAppetizerListOne)
                : currentIndex == 2
                    ? CustomSelectThree(list: Constants.promoDessertListOne)
                    : Text('ERROR'),
      );
    } else if (widget.type == '2') {
      return Container(
        child: currentIndex == 0
            ? CustomSelectOne(list: Constants.promoPizzasListTwo)
            : currentIndex == 1
                ? CustomSelectTwo(list: Constants.promoAppetizerListTwo)
                : currentIndex == 2
                    ? CustomSelectThree(list: Constants.promoDessertListTwo)
                    : currentIndex == 3
                        ? CustomSelectFour(list: Constants.promoBeverageListOne)
                        : Text('ERROR'),
      );
    } else if (widget.type == '3') {
      return Container(
        child: currentIndex == 0
            ? CustomSelectOne(list: Constants.promoPizzasListThree)
            : currentIndex == 1
                ? CustomSelectTwo(list: Constants.promoAppetizerListTwo)
                : currentIndex == 2
                    ? CustomSelectThree(list: Constants.promoDessertListThree)
                    : currentIndex == 3
                        ? CustomSelectFour(list: Constants.promoBeverageListOne)
                        : Text('ERROR'),
      );
    } else if (widget.type == '4') {
      return Container(
        child: currentIndex == 0
            ? CustomSelectOne(list: Constants.promoPizzasListFour)
            : currentIndex == 1
                ? CustomSelectTwo(list: Constants.promoPizzasListFive)
                : Text('ERROR'),
      );
    } else if (widget.type == '5') {
      return Container(
        child: currentIndex == 0
            ? CustomSelectOne(list: Constants.promoPizzasListSix)
            : currentIndex == 1
                ? CustomSelectTwo(list: Constants.promoPizzasListSix)
                : Text('ERROR'),
      );
    } else if (widget.type == '6') {
      return Container(
        child: currentIndex == 0
            ? CustomSelectOne(list: Constants.promoPastaListOne)
            : currentIndex == 1
                ? CustomSelectTwo(list: Constants.promoDessertListFour)
                : currentIndex == 2
                    ? CustomSelectThree(list: Constants.promoBeverageListTwo)
                    : currentIndex == 3
                        ? CustomSelectFour(
                            list: Constants.promoAppetizerListThree)
                        : Text('ERROR'),
      );
    } else if (widget.type == '7') {
      return Container(
        child: currentIndex == 0
            ? CustomSelectOne(list: Constants.promoPizzasListFive)
            : currentIndex == 1
                ? CustomSelectTwo(list: Constants.promoPizzasListFive)
                : currentIndex == 2
                    ? CustomSelectThree(list: Constants.promoAppetizerListOne)
                    : currentIndex == 3
                        ? CustomSelectFour(
                            list: Constants.promoAppetizerListOne)
                        : currentIndex == 4
                            ? CustomSelectFive(
                                list: Constants.promoAppetizerListOne)
                            : currentIndex == 5
                                ? CustomSelectSix(
                                    list: Constants.promoDessertListSix)
                                : currentIndex == 6
                                    ? CustomSelectSeven(
                                        list: Constants.promoDessertListSix)
                                    : currentIndex == 7
                                        ? CustomSelectEight(
                                            list: Constants
                                                .promoBeverageListThree)
                                        : currentIndex == 8
                                            ? CustomSelectNine(
                                                list: Constants
                                                    .promoBeverageListThree)
                                            : Text('ERROR'),
      );
    } else if (widget.type == '8') {
      return Container(
        child: currentIndex == 0
            ? CustomSelectOne(list: Constants.promoPizzasListSeven)
            : currentIndex == 1
                ? CustomSelectTwo(list: Constants.promoPizzasListSeven)
                : currentIndex == 2
                    ? CustomSelectThree(list: Constants.promoAppetizerListFour)
                    : currentIndex == 3
                        ? CustomSelectFour(
                            list: Constants.promoAppetizerListFour)
                        : currentIndex == 4
                            ? CustomSelectFive(
                                list: Constants.promoAppetizerListFour)
                            : currentIndex == 5
                                ? CustomSelectSix(
                                    list: Constants.promoDessertListSix)
                                : currentIndex == 6
                                    ? CustomSelectSeven(
                                        list: Constants.promoDessertListSix)
                                    : currentIndex == 7
                                        ? CustomSelectEight(
                                            list: Constants
                                                .promoBeverageListThree)
                                        : currentIndex == 8
                                            ? CustomSelectNine(
                                                list: Constants
                                                    .promoBeverageListThree)
                                            : Text('ERROR'),
      );
    } else {
      return Container(
        child: Text('ERROR'),
      );
    }
  }

  Widget getAddToCart() {
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
