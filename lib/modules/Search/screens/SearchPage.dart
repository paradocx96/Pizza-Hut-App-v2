import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Cart/screens/Cart.dart';
import 'package:pizzahut/modules/homepage/screens/view_addresses/view_addresses.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const routeName = "/search/searchPage";

  @override
  _SearchPageState createState() => _SearchPageState();
}
const secondaryColor = Color(0xffF1F1F1);
class _SearchPageState extends State<SearchPage> {

  final _text = TextEditingController();
  String dropdownValue = "Pizza";

  @override
  Widget build(BuildContext context) {
    //image asset for logog
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
            onPressed: () {
              Navigator.pushNamed(context, Cart.routeName);
            },
          ),
        ],
      ),
      body: Container(
        color: secondaryColor,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  //color: Colors.white,
                  child: TextField(
                    controller: _text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Search',
                      hintText: 'Enter keyword',
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  iconSize: 24,
                  underline: Container(
                    height: 2,
                    color: Theme.of(context).accentColor,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  isExpanded: true,
                  items: <String>['Pizza', 'Pasta', 'Appetizers']
                    .map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
