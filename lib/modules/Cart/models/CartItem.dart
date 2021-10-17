class CartItem {
  late String itemType;
  late String name;
  late int  price;
  late int quantity;

  //pizza attributes
  late String pizzaRange;
  late String pizzaSize;
  late String crust;
  late String topping;
  late String extras;

  //pasta attributes

  //appetizers
  late String appetizerSize;

  //getter for price
  /*int get price{
    return price;
  }*/

  CartItem(
      this.itemType,
      this.name,
      this.price,
      this.quantity,
      this.pizzaRange,
      this.pizzaSize,
      this.crust,
      this.topping,
      this.extras,
      this.appetizerSize);
}