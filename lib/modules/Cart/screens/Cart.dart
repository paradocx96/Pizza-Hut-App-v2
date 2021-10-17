import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Cart/models/CartModel.dart';
import 'package:pizzahut/modules/homepage/screens/view_addresses/view_addresses.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  static const routeName = "/cart/cartView";

  @override
  _CartState createState() => _CartState();
}

const secondaryColor = Color(0xffF1F1F1);
const cardColor = Color(0xffDCFFDF);

class _CartState extends State<Cart> {

  bool isCheckoutEnabled = false;


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
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delivery_dining),
            onPressed: () {


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
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        //color: secondaryColor,
        child: Column(
          children: [
            //Text("Cart"),
            Consumer<CartModel>(builder: (context, cart, child) {
              if (cart.items.isEmpty) {
                return Center(
                  child: Text(
                    "Cart is empty",
                    style: TextStyle(fontSize: 40),
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: cart.items.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: Card(
                            color: cardColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: ListTile(
                                title: cart.items[index].itemType == 'Pizza'
                                    ? Text(cart.items[index].name +
                                            ", " +
                                            cart.items[index].topping +
                                            " topping, " +
                                            cart.items[index].pizzaSize +
                                            ", " +
                                            cart.items[index].crust +
                                            " "
                                        //cart.items[index].extras == 'none'? "": ""
                                        )
                                    : Text(cart.items[index].name),
                                subtitle: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: ElevatedButton(
                                              onPressed: (){
                                                cart.decrementQuantity(cart.items[index]);
                                              },
                                              child: const Icon(Icons.remove) ,
                                            style: ButtonStyle(
                                              foregroundColor:
                                              MaterialStateProperty.all<Color>(Colors.white),
                                              backgroundColor: MaterialStateProperty.all<Color>(
                                                  Colors.green),
                                              minimumSize: MaterialStateProperty.all(Size(10, 10)),
                                            ),
                                          ),
                                        ),

                                        ElevatedButton(
                                            onPressed: (){
                                              cart.incrementQuantity(cart.items[index]);
                                            },
                                            child: const Icon(Icons.add) ,
                                          style: ButtonStyle(
                                            foregroundColor:
                                            MaterialStateProperty.all<Color>(Colors.white),
                                            backgroundColor: MaterialStateProperty.all<Color>(
                                                Colors.green),
                                            minimumSize: MaterialStateProperty.all(Size(10, 10)),
                                          ),
                                        )

                                      ],
                                    ),

                                    Text("Quantity: " +
                                        cart.items[index].quantity.toString() +
                                        "\n" +
                                        "Rs." +
                                        cart.items[index].price.toString() +
                                        "/=" ,style: TextStyle(fontSize: 18),),
                                  ],
                                ),

                                trailing: IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return CupertinoAlertDialog(
                                              title: const Text("Remove item"),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: const <Widget>[
                                                    Text(
                                                        "Do you want to remove this item from the cart?")
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: const Text("No")),
                                                TextButton(
                                                    onPressed: () {
                                                      //remove the selected item
                                                      cart.removeItem(
                                                          cart.items[index]);
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: const Text("Yes"))
                                              ],
                                            );
                                          });
                                    },
                                    iconSize: 50,
                                    icon: const Icon(Icons.delete) ),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }
            }),
            Consumer<CartModel>(builder: (context, cart, child) {
              return Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Continue shopping",
                                style: TextStyle(color: Colors.black, fontSize: 15),),
                              style: ButtonStyle(
                                foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.amber),
                                minimumSize: MaterialStateProperty.all(Size(180, 40)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title:
                                        const Text("Remove all items from the cart?"),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: const <Widget>[
                                              Text("This cannot be undone")
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("No")),
                                          TextButton(
                                              onPressed: () {
                                                cart.removeAll();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Yes"))
                                        ],
                                      );
                                    });
                              },
                              child: Text("Clear cart", style: TextStyle(fontSize: 15),),
                              style: ButtonStyle(
                                foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Theme.of(context).accentColor),
                                minimumSize: MaterialStateProperty.all(Size(180, 40)),
                              ),
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                  Container(
                    width: 380,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              "Total Price",
                              style: TextStyle(
                                  fontSize: 25, color: Theme.of(context).accentColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              "Rs." + cart.totPrice.toString() + "/=",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  cart.items.isEmpty?
                  ElevatedButton(
                      onPressed: null ,
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.grey),
                        minimumSize: MaterialStateProperty.all(Size(370, 40)),
                      ),
                      child: Text("Checkout",style: TextStyle(fontSize: 25),)
                  ):
                      ElevatedButton(onPressed: (){},
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green),
                            minimumSize: MaterialStateProperty.all(Size(370, 40)),
                          ),
                          child:Text("Checkout",style: TextStyle(fontSize: 25),) )


                  /*Text(
                    "Total Price",
                    style: TextStyle(
                        fontSize: 25, color: Theme.of(context).accentColor),
                  ),
                  Text(
                    "Rs." + cart.totPrice.toString() + "/=",
                    style: TextStyle(fontSize: 20),
                  ),*/

                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
