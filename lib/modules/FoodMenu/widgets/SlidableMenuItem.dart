import 'package:flutter/material.dart';

class SlidableMenuItem extends StatelessWidget {
  //const SlideableMenuItem({Key? key}) : super(key: key);

  final String itemType;

  SlidableMenuItem(this.itemType);

  @override
  Widget build(BuildContext context) {

    const double imageLength = 70;
    const double outerLength = 100;

    Widget pizzaImage = Container(
      height: imageLength,
      width: imageLength,
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset("images/pizza_main.jpg")),
    );

    Widget pastaImage = Container(
      height: imageLength,
      width: imageLength,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Image.asset("images/pasta_main.jpg"),
      ),
    );

    Widget appetizerImage = Container(
      height: imageLength,
      width: imageLength,
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset("images/cheesy_garlic_bread_main.jpg")),
    );

    Widget desertImage = Container(
      height: imageLength,
      width: imageLength,
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset("images/lava_cake_main.jpg")),
    );

    Widget beveragesImage = Container(
      height: imageLength,
      width: imageLength,
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset("images/chocolate_milkshake_main.jpg")),
    );

    Widget promoImage = Container(
      height: imageLength,
      width: imageLength,
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset("images/promo_main.jpg")),
    );

    return Container(
      height: outerLength,
      width: outerLength,
      child: Column(
        children: [
          Center(
            child:
            this.itemType == "pizza"? pizzaImage :
            this.itemType == "pasta" ? pastaImage :
            this.itemType == "appetizer" ? appetizerImage:
                this.itemType == "desert"? desertImage:
                    this.itemType == "beverages"? beveragesImage:
                        this.itemType == "promo"? promoImage:
            pastaImage,

          ),
          Center(
            child:
            this.itemType == "pizza"? Text("Pizza") :
            this.itemType == "pasta" ? Text("Pasta") :
            this.itemType == "appetizer" ? Text("Appetizer") :
                this.itemType == "desert" ? Text("Deserts") :
                    this.itemType == "beverages" ? Text("Beverages") :
                    this.itemType == "promo" ? Text("Promos")
                : Text("Pasta"),
          )
        ],
      ),
    );
  }
}
