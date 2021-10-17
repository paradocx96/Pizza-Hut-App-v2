import 'package:flutter/material.dart';

class PizzaCrustSelector extends StatefulWidget {
  const PizzaCrustSelector({Key? key, required this.onChanged, required this.selectedCrust}) : super(key: key);

  final ValueChanged<String> onChanged;
  final String selectedCrust;

  @override
  _PizzaCrustSelectorState createState() => _PizzaCrustSelectorState();
}

class _PizzaCrustSelectorState extends State<PizzaCrustSelector> {

  String activeCrust = "Pan";

  void changeCrust(String crust){
    widget.onChanged(crust);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      activeCrust = widget.selectedCrust;
    });
  }


  @override
  Widget build(BuildContext context) {

    double containerHeight = 90.0;

    return Container(child: Center(
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              changeCrust("Pan");
              activeCrust = 'Pan';
            },
            child: Container(
              height: containerHeight,
              width: containerHeight,
              child: Card(
                elevation: 5,
                color: activeCrust == 'Pan'? Theme.of(context).accentColor: Colors.white,
                child: Column(
                  children: [
                    Spacer(),
                    Icon(Icons.local_pizza,
                      color: activeCrust == "Pan"? Colors.white: Colors.black,
                    ),
                    Spacer(),
                    Text("Pan", style: TextStyle(
                        fontSize: 20,
                        color: activeCrust == "Pan"? Colors.white: Colors.black
                    ),),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          GestureDetector(onTap:(){
            changeCrust("Stuffed");
            activeCrust ='Stuffed';
          },
            child: Container(
              height: containerHeight,
              width: containerHeight,
              child: Card(
                elevation: 5,
                color: activeCrust == "Stuffed"? Theme.of(context).accentColor : Colors.white,
                child: Column(
                  children: [
                    Spacer(),
                    Icon(Icons.local_pizza,
                      color: activeCrust == "Stuffed"? Colors.white: Colors.black,
                    ),
                    Spacer(),
                    Text("Stuffed", style: TextStyle(
                        fontSize: 20,
                        color: activeCrust == "Stuffed"? Colors.white: Colors.black
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
              changeCrust("Sausage");
              activeCrust = "Sausage";
            },
            child: Container(
              height: containerHeight,
              width: containerHeight,
              child: Card(
                elevation: 5,
                color: activeCrust == "Sausage"? Theme.of(context).accentColor: Colors.white,
                child: Column(
                  children: [
                    Spacer(),
                    Icon(Icons.local_pizza,
                      color: activeCrust== "Sausage"? Colors.white: Colors.black,
                    ),
                    Spacer(),
                    Text("Sausage", style: TextStyle(
                        fontSize: 20,
                        color: activeCrust == "Sausage"? Colors.white: Colors.black),),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),

          Spacer(),

          GestureDetector(
            onTap: (){
              changeCrust("Thin");
              activeCrust = "Thin";
            },
            child: Container(
              height: containerHeight,
              width: containerHeight,
              child: Card(
                elevation: 5,
                color: activeCrust == "Thin"? Theme.of(context).accentColor: Colors.white,
                child: Column(
                  children: [
                    Spacer(),
                    Icon(Icons.local_pizza,
                      color: activeCrust== "Thin"? Colors.white: Colors.black,
                    ),
                    Spacer(),
                    Text("Thin", style: TextStyle(
                        fontSize: 20,
                        color: activeCrust == "Thin"? Colors.white: Colors.black),),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    ),);
  }
}
