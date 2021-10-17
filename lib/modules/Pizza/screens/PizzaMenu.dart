import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Pizza/models/PizzaModel.dart';
import 'package:pizzahut/modules/Pizza/models/PizzaSingleViewArguments.dart';
import 'package:pizzahut/modules/Pizza/screens/PizzaSingleView.dart';
import 'package:pizzahut/utils/services/PizzaService.dart' as PizzaService;

class PizzaMenu extends StatefulWidget {
  const PizzaMenu({Key? key}) : super(key: key);

  @override
  _PizzaMenuState createState() => _PizzaMenuState();
}

class _PizzaMenuState extends State<PizzaMenu> {

  Color secondaryColor = Color(0xffF1F1F1);



  List<PizzaModel> pizzas = [
    PizzaModel(
        name: "BBQ Chicken", range: "Classic", flag: "bbq_chicken_pizza.jpg",
      description: "This a description of the pizza. This a description of the pizza."
    ),
    PizzaModel(
        name: "Black Chicken",
        range: "Classic",
        flag: "black_chicken_pizza.jpg",
        description: "This a description of the pizza. This a description of the pizza."
    ),
    PizzaModel(
        name: "Hot and Spicy Chicken",
        range: "Classic",
        flag: "hotspicy_chicken.jpg",
        description: "This a description of the pizza. This a description of the pizza."),

    PizzaModel(
        name: "Hot and Spicy Chicken1",
        range: "Classic",
        flag: "hotspicy_chicken.jpg",
        description: "This a description of the pizza. This a description of the pizza."),
    PizzaModel(
        name: "Hot and Spicy Chicken1",
        range: "Classic",
        flag: "hotspicy_chicken.jpg",
        description: "This a description of the pizza. This a description of the pizza."),
    PizzaModel(
        name: "Hot and Spicy Chicken1",
        range: "Classic",
        flag: "hotspicy_chicken.jpg",
        description: "This a description of the pizza. This a description of the pizza."),
    PizzaModel(
        name: "Hot and Spicy Chicken1",
        range: "Classic",
        flag: "hotspicy_chicken.jpg",
        description: "This a description of the pizza. This a description of the pizza."),
    PizzaModel(
        name: "Hot and Spicy Chicken1",
        range: "Classic",
        flag: "hotspicy_chicken.jpg",
        description: "This a description of the pizza. This a description of the pizza."),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 25,
                color: secondaryColor,
                width: MediaQuery.of(context).size.width,
                child: Text("Pizza",style: TextStyle(fontSize: 20),),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height -225,
              child: ListView.builder(
                itemCount: pizzas.length,
                  itemExtent: 100,
                  itemBuilder: (context, index) {
                return Padding(
                  /*padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 5.0),*/
                  padding: EdgeInsets.all(5),
                  child: Card(
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(10))),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: ListTile(
                        minLeadingWidth: 100,
                        onTap: () {
                          Navigator.pushNamed(context, PizzaSingleView.routeName,
                              arguments: PizzaSingleViewArguments(pizzas[index]) //navigate to pizza
                          );
                        },
                        title: Text(pizzas[index].name),
                        leading: Image(
                            image:
                                AssetImage('images/pizza/${pizzas[index].flag}')),
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      )),
    );
  }
}
