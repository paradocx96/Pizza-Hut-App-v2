import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Cart/screens/Cart.dart';
import 'package:pizzahut/modules/contact/screens/user_feedback.dart';
import 'package:pizzahut/modules/homepage/screens/view_addresses/view_addresses.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  static const routeName = "/contact/contact-us";

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  //image asset for logog
  Widget pizzaHutLogo_image = Container(
    height: 50,
    child: Image.asset("images/pizza_hut_logo.png"),
  );

  @override
  Widget build(BuildContext context) {
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
              Navigator.pushNamed(context, Cart.routeName);
            },
          ),
        ],
      ),
      body: getBody(context),
    );
  }
}

Widget getBody(context) {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  return SafeArea(
    child: Container(
      decoration: BoxDecoration(color: Color(0xFFF4EFEF)),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Text(
              'CONTACT US',
              style: TextStyle(height: 1.5, fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserFeedback()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('FEEDBACK'),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                      size: 24.0,
                      semanticLabel: 'FEEDBACK',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            height: 210,
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
                    'HOTLINE',
                    style: TextStyle(height: 2, fontSize: 25),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          '+94 112 729729',
                          style: TextStyle(height: 1, fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 20.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          '+94 114 729729',
                          style: TextStyle(height: 1, fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 20.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          '+94 117 729729',
                          style: TextStyle(height: 1, fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 20.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            height: 180,
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
                    'ADDRESS',
                    style: TextStyle(height: 2, fontSize: 25),
                  ),
                ),
                Container(
                  child: Text(
                    'Pizza Hut Sri Lanka Head Office',
                    style: TextStyle(height: 2, fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    'Gamma Pizzakraft Lanka (Pvt) Ltd,\nPizza Hut – Sri Lanka\n321/A, Union Place,Colombo-02,\nSri Lanka',
                    style: TextStyle(height: 1.2, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
