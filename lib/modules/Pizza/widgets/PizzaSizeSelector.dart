import 'package:flutter/material.dart';

class PizzaSizeSelector extends StatefulWidget {
  const PizzaSizeSelector({Key? key,
    required this.onChanged, required this.selectedSize,}) : super(key: key);

  //final String size;
  final ValueChanged<String> onChanged;
  final String selectedSize;

  @override
  _PizzaSizeSelectorState createState() => _PizzaSizeSelectorState();
}

class _PizzaSizeSelectorState extends State<PizzaSizeSelector> {

  String activeSize = "Personal";

  @override
  void initState() {
    super.initState();
    setState(() {
      activeSize = widget.selectedSize;
    });
  }


  void selectPersonal(){
    widget.onChanged("Personal");
  }

  void selectMedium(){
    widget.onChanged("Medium");
  }

  void selectLarge(){
    widget.onChanged("Large");
  }

  @override
  Widget build(BuildContext context) {

    double containerHeight = 100.0;

    return Container(
      child: Center(
        child: Row(
          children: [
            GestureDetector(
              onTap: (){
                selectPersonal();
                activeSize = 'Personal';
                },
              child: Container(
                height: containerHeight,
                width: containerHeight,
                child: Card(
                  elevation: 5,
                  color: activeSize == 'Personal'? Theme.of(context).accentColor: Colors.white,
                child: Column(
                  children: [
                    Spacer(),
                    Icon(Icons.local_pizza,
                      color: activeSize == "Personal"? Colors.white: Colors.black,
                    ),
                    Spacer(),
                    Text("Personal", style: TextStyle(
                        fontSize: 20,
                        color: activeSize == "Personal"? Colors.white: Colors.black
                    ),),
                    Spacer(),
                  ],
                ),
            ),
              ),
            ),
            Spacer(),
            GestureDetector(onTap:(){
              selectMedium();
              activeSize ='Medium';
              },
              child: Container(
                height: containerHeight,
                width: containerHeight,
                child: Card(
                  elevation: 5,
                  color: activeSize == "Medium"? Theme.of(context).accentColor : Colors.white,
                child: Column(
                  children: [
                    Spacer(),
                    Icon(Icons.local_pizza,
                      color: activeSize == "Medium"? Colors.white: Colors.black,
                    ),
                    Spacer(),
                    Text("Medium", style: TextStyle(
                        fontSize: 20,
                        color: activeSize == "Medium"? Colors.white: Colors.black
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
                selectLarge();
                activeSize = "Large";
                },
              child: Container(
                height: containerHeight,
                width: containerHeight,
                child: Card(
                  elevation: 5,
                  color: activeSize == "Large"? Theme.of(context).accentColor: Colors.white,
                child: Column(
                  children: [
                    Spacer(),
                    Icon(Icons.local_pizza,
                    color: activeSize == "Large"? Colors.white: Colors.black,
                    ),
                    Spacer(),
                    Text("Large", style: TextStyle(
                      fontSize: 20,
                        color: activeSize == "Large"? Colors.white: Colors.black),),
                    Spacer(),
                  ],
                ),
            ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
