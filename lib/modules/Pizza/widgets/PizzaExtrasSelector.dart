import 'package:flutter/material.dart';

class PizzaExtrasSelector extends StatefulWidget {
  const PizzaExtrasSelector({Key? key,required this.onChanged, required this.selectedExtras}) : super(key: key);

  final ValueChanged<String> onChanged;
  final String selectedExtras;

  @override
  _PizzaExtrasSelectorState createState() => _PizzaExtrasSelectorState();
}

class _PizzaExtrasSelectorState extends State<PizzaExtrasSelector> {

  String activeItem = "none";

  //in initialization receive extras value from parent and set it to activeItem
  @override
  void initState() {
    super.initState();
    setState(() {
      activeItem = widget.selectedExtras;
    });
  }

  void changeExtra(String extra){
    widget.onChanged(extra);
  }


  @override
  Widget build(BuildContext context) {

    double containerHeight = 90.0;

    return Container(child: Center(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  changeExtra("Cheese");
                  activeItem = 'Cheese';
                },
                child: Container(
                  height: containerHeight,
                  width: containerHeight,
                  child: Card(
                    elevation: 5,
                    color: activeItem == 'Cheese'? Theme.of(context).accentColor: Colors.white,
                    child: Column(
                      children: [
                        Spacer(),
                        Icon(Icons.local_pizza,
                          color: activeItem == "Cheese"? Colors.white: Colors.black,
                        ),
                        Spacer(),
                        Text("Cheese", style: TextStyle(
                            fontSize: 18,
                            color: activeItem == "Cheese"? Colors.white: Colors.black
                        ),),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(onTap:(){
                changeExtra("Olives");
                activeItem ='Olives';
              },
                child: Container(
                  height: containerHeight,
                  width: containerHeight,
                  child: Card(
                    elevation: 5,
                    color: activeItem == "Olives"? Theme.of(context).accentColor : Colors.white,
                    child: Column(
                      children: [
                        Spacer(),
                        Icon(Icons.local_pizza,
                          color: activeItem == "Olives"? Colors.white: Colors.black,
                        ),
                        Spacer(),
                        Text("Olives", style: TextStyle(
                            fontSize: 18,
                            color: activeItem == "Olives"? Colors.white: Colors.black
                        ),),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),

              Spacer(),
              GestureDetector(
                onTap: (){
                  changeExtra("Onions");
                  activeItem = "Onions";
                },
                child: Container(
                  height: containerHeight,
                  width: containerHeight,
                  child: Card(
                    elevation: 5,
                    color: activeItem == "Onions"? Theme.of(context).accentColor: Colors.white,
                    child: Column(
                      children: [
                        Spacer(),
                        Icon(Icons.local_pizza,
                          color: activeItem== "Onions"? Colors.white: Colors.black,
                        ),
                        Spacer(),
                        Text("Onions", style: TextStyle(
                            fontSize: 18,
                            color: activeItem == "Onions"? Colors.white: Colors.black),),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),

              Spacer(),

              GestureDetector(
                onTap: (){
                  changeExtra("Capsicum");
                  activeItem = "Capsicum";
                },
                child: Container(
                  height: containerHeight,
                  width: containerHeight,
                  child: Card(
                    elevation: 5,
                    color: activeItem == "Capsicum"? Theme.of(context).accentColor: Colors.white,
                    child: Column(
                      children: [
                        Spacer(),
                        Icon(Icons.local_pizza,
                          color: activeItem== "Capsicum"? Colors.white: Colors.black,
                        ),
                        Spacer(),
                        Text("Capsicum", style: TextStyle(
                            fontSize: 18,
                            color: activeItem == "Capsicum"? Colors.white: Colors.black),),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  changeExtra("none");
                  activeItem = "none";
                },
                child: Container(
                  height: containerHeight,
                  width: containerHeight,
                  child: Card(
                    elevation: 5,
                    color: activeItem == "none"? Theme.of(context).accentColor: Colors.white,
                    child: Column(
                      children: [
                        Spacer(),
                        Icon(Icons.local_pizza,
                          color: activeItem== "none"? Colors.white: Colors.black,
                        ),
                        Spacer(),
                        Text("None", style: TextStyle(
                            fontSize: 18,
                            color: activeItem == "none"? Colors.white: Colors.black),),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],

      ),
    ),);
  }
}
