import 'package:flutter/material.dart';
import 'package:pizzahut/modules/Pizza/models/PizzaModel.dart';
import 'package:pizzahut/modules/Pizza/models/PizzaSingleViewArguments.dart';
import 'package:pizzahut/utils/services/PizzaService.dart'as PizzaService;

import 'PizzaSingleView.dart';

class PizzaMenu2 extends StatefulWidget {
  const PizzaMenu2({Key? key}) : super(key: key);

  @override
  _PizzaMenu2State createState() => _PizzaMenu2State();
}

class _PizzaMenu2State extends State<PizzaMenu2> {

  Color secondaryColor = Color(0xffF1F1F1);

  late Future<List<PizzaModel>> futureListPizzas;

  List<dynamic> pizzas1 = [
    PizzaModel(
        name: "BBQ Chicken", range: "Classic", flag: "bbq_chicken_pizza.jpg",
        description: "This a description of the pizza. This a description of the pizza."
    ),
  ];


  @override
  void initState() {
    super.initState();
    futureListPizzas= PizzaService.fetchAllPizzas();
    //getPizzas();
  }

  void getPizzas() {
    setState(() {
      futureListPizzas= PizzaService.fetchAllPizzas();
      print(futureListPizzas.toString());
    });
  }



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
                FutureBuilder<List<PizzaModel>>(
                  future: futureListPizzas,
                  builder: (context, snapshot){
                    print("snap shot has data: "+ snapshot.hasData.toString());
                    if(snapshot.hasData){
                      print("Assigning list");
                      List<PizzaModel>? pizzas  =snapshot.data;

                      //expanded widget added to fix Galaxy A50S bottom overflow problem
                      return Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height -225,
                          child: ListView.builder(
                              itemCount: pizzas!.length,
                              //itemExtent: 100,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  /*padding: const EdgeInsets.symmetric(
                          vertical: 1.0, horizontal: 5.0),*/
                                  padding: EdgeInsets.all(5),
                                  child: Card(
                                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(10))),
                                    elevation: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
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
                        ),
                      );
                    }
                    else if(snapshot.hasError){
                      return Text('${snapshot.error}');
                    }

                    return const CircularProgressIndicator();
                  },
                )
              ],
            ),
          )),
    );
  }
}
