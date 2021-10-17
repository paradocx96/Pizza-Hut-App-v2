import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Cart/models/CartItem.dart';
import 'package:pizzahut/modules/Cart/models/CartModel.dart';
import 'package:pizzahut/modules/Cart/screens/Cart.dart';
import 'package:pizzahut/modules/Pizza/models/PizzaExtrasModel.dart';
import 'package:pizzahut/modules/Pizza/models/PizzaRangeModel.dart';
import 'package:pizzahut/modules/Pizza/models/PizzaSingleViewArguments.dart';
import 'package:pizzahut/modules/Pizza/models/PizzaToppingModel.dart';
import 'package:pizzahut/modules/Pizza/util/PizzaPriceCalculator.dart';
import 'package:pizzahut/modules/Pizza/widgets/PizzaSizeSelector.dart';
import 'package:pizzahut/modules/Pizza/widgets/PizzaCrustSelector.dart';
import 'package:pizzahut/modules/Pizza/widgets/PizzaExtrasSelector.dart';
import 'package:pizzahut/modules/Pizza/widgets/PizzaToppingSelector.dart';
import 'package:pizzahut/modules/Pizza/widgets/PizzaSpecialInstructions.dart';
import 'package:pizzahut/modules/homepage/screens/view_addresses/view_addresses.dart';
import 'package:provider/provider.dart';

class PizzaSingleView extends StatefulWidget {
  const PizzaSingleView({Key? key}) : super(key: key);

  static const routeName = "/menus/pizza/singleView";

  @override
  _PizzaSingleViewState createState() => _PizzaSingleViewState();
}

class _PizzaSingleViewState extends State<PizzaSingleView> {

  int currentIndex = 0;

  String name= "Pizza";
  String size = "Personal";
  String crust = "Pan";
  String extras = "none";
  String toppingHalf = "none";
  String specialInstructions = "none";
  bool mayo = false;
  bool isHalf = false;
  int quantity = 1;

  String range = "initial";

  int unitPrice = 0;
  int totalPrice = 0;

  //instantiate an extras model
  PizzaExtrasModel extrasModel =  new PizzaExtrasModel(200,150,50,70);

  //instantiate a pizza range model list
  List<PizzaRangeModel> ranges = [
    PizzaRangeModel("Classic", 500, 1100, 1900, 530, 1200, 2200, 520, 1150, 2100, 450, 900, 1700),
    PizzaRangeModel("Favourites", 500, 1100, 1900, 530, 1200, 2200, 520, 1150, 2100, 450, 900, 1700),
  ];

  void _handleSizeChange(String newSize){
    setState(() {
      size = newSize;
      unitPrice = PizzaPriceCalculator.calculatePrice(range, size, crust);
    });

    print(size);
  }
  
  void _handleCrustChange(String newCrust){
    setState(() {
      crust = newCrust;
      unitPrice = PizzaPriceCalculator.calculatePrice(range, size, crust);
    });

    print(crust);
  }

  void _handleExtrasChange(String newExtra) {
    setState(() {
      extras = newExtra;

    });

    print("_handleExtrasChange : unit price : " + unitPrice.toString());
  }

  void _handleToppingChange(PizzaToppingModel toppingModel){
    setState(() {
      toppingHalf = toppingModel.toppingHalf;
      mayo = toppingModel.mayo;
      isHalf = toppingModel.isHalf;
    });
  }

  void _handleSpecialInstructionChange(String instruction){
    setState(() {
      specialInstructions = instruction;
    });
  }

  void _incrementQuantity(){
    setState(() {
      quantity++;
      //totalPrice = unitPrice * quantity;
    });
  }

  void _decrementQuantity(){

    if(quantity > 1){
      setState(() {
        quantity--;
        //totalPrice = unitPrice * quantity;
      });
    }

  }

  void _addToCart(String name){
    final args = ModalRoute.of(context)!.settings.arguments as PizzaSingleViewArguments;

    if(toppingHalf == "none"){
      Provider.of<CartModel>(context, listen: false).add(
          CartItem("Pizza", args.pizza.name, totalPrice ,quantity, args.pizza.range, size, crust, "single", extras, "none")
      );
    }
    else{
      Provider.of<CartModel>(context, listen: false).add(
          CartItem("Pizza", args.pizza.name, totalPrice ,quantity, args.pizza.range, size, crust, toppingHalf + " half ", extras, "none")
      );
    }

  }

  void _setBasePrice(String range){

    print("running _setBasePrice");
    for(var i = 0; i < ranges.length; i++){
      if(ranges[i].name == range){

        //range is set once per single view
        setState(() {
          range = range;

          //initial unit price will always be pan personal price
          unitPrice = PizzaPriceCalculator.calculatePrice(range, size, crust);

          if(extras != "none"){
            unitPrice = PizzaPriceCalculator.calculatePriceWithExtras(range, size, crust, extras);
          }
          totalPrice = unitPrice * quantity;
        });
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PizzaSingleViewArguments;

    _setBasePrice(args.pizza.range);

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
          onPressed: (){
            Navigator.of(context).pop();
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image(
                            height: 200,
                            width: 200,
                              image:
                              AssetImage('images/pizza/${args.pizza.flag}')),
                        ),
                        Text('${args.pizza.name}',style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('${args.pizza.description}', style: TextStyle(fontSize: 15)),
                        )
                      ],
                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("Selected Options",style: TextStyle(fontSize: 15 ,
                      fontWeight: FontWeight.bold, color: Theme.of(context).accentColor ), ),
                ),
              ),

              Center(
                child: Text("Size : "+ size, style: TextStyle(fontSize: 15),),
              ),

              mayo? Center(child: Text("Mayo Applied", style: TextStyle(fontSize: 15),),) : Center(),

              toppingHalf != "none"? Center(
                child: Text("Other half : " + toppingHalf, style: TextStyle(fontSize: 15),),
              ) : Center(),

              Center(
                child: Text("Crust: " + crust, style: TextStyle(fontSize: 15),),
              ),

              extras!="none" ? Center(
                child: Text("Extras: " + extras, style: TextStyle(fontSize: 15),),
              ): Center(),

              specialInstructions != "none" ? Center(
                child: Text("Special Instructions: " +specialInstructions, style: TextStyle(fontSize: 15),),
              ):Center(),

              //Spacer(),


              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: BottomNavigationBar(
                    selectedItemColor: Theme.of(context).accentColor,
                    backgroundColor: Theme.of(context).primaryColor,
                    unselectedItemColor: Colors.black,
                    type: BottomNavigationBarType.fixed,
                    iconSize: 40,
                    selectedFontSize: 20,
                    unselectedFontSize: 15,
                    currentIndex: currentIndex,
                    //currentIndex: args.navbarIndex,
                    onTap: (index) => setState(() => currentIndex = index) ,

                    items: [
                      BottomNavigationBarItem(
                        icon: Text(''),
                        label: 'Size',
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      BottomNavigationBarItem(
                        icon: Text(''),
                        label: 'Topping',
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      BottomNavigationBarItem(
                        icon: Text(''),
                        label: 'Crust',
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      BottomNavigationBarItem(
                        icon: Text(''),
                        label: 'Extras',
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      BottomNavigationBarItem(
                        icon: Text(''),
                        label: 'Others',
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ]),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  child: currentIndex == 0? PizzaSizeSelector(
                    onChanged: _handleSizeChange, selectedSize: size,

                  ) :
                  currentIndex == 1? PizzaToppingSelector(
                    onChanged: _handleToppingChange, mayoStatus: mayo, halfToppingStatus: isHalf,
                    otherHalf: toppingHalf,):
                  currentIndex == 2? PizzaCrustSelector(
                    onChanged: _handleCrustChange, selectedCrust: crust,):
                  currentIndex == 3? PizzaExtrasSelector(
                    onChanged: _handleExtrasChange, selectedExtras:  extras,):
                  currentIndex == 4? SpecialInstructions(onChanged: _handleSpecialInstructionChange):
                  Text("data"),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text("Rs." + totalPrice.toString(), style: TextStyle(fontSize: 20),),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 105,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: (){
                            _decrementQuantity();
                          },
                          child: Text("-", style: TextStyle(fontSize: 30),),
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(quantity.toString(), style: TextStyle(fontSize: 20),) ),
                      ),
                    ),
                    Container(
                      width: 105,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: (){
                            _incrementQuantity();
                          },
                          child: Text("+", style: TextStyle(fontSize: 30),),

                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 380,
                child: ElevatedButton(
                  onPressed: (){
                    _addToCart(args.pizza.name);
                    showDialog(context: context, builder: (BuildContext context){
                      return CupertinoAlertDialog(
                        title: const Text("Added to cart"),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget> [
                              //Text("Added to cart")
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          },
                              child: const Text("OK"))
                        ],
                      );
                    }

                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Add to Cart",style: TextStyle(fontSize: 20),),

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


                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green),
                    minimumSize: MaterialStateProperty.all(Size(180, 40)),
                  ),
                ),
              )





            ],
          ),
        ),
      ),
    );
  }
}
