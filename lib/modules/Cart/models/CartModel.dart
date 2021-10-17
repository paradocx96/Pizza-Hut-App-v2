import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:pizzahut/modules/Cart/models/CartItem.dart';

class CartModel extends ChangeNotifier{

  //internal private state of the cart
  final List<CartItem> _items = [];
  late int totalPrice = 0;

  //an unmodifiable view of the items in cart
  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  //getter for total price
  int get totPrice{
    return totalPrice;
  }

  //setter for total price
  set totPrice (int price){
    totalPrice = price;
  }

  //method to add an item to the cart
  void add(CartItem item){
    _items.add(item);
    totalPrice += item.price;

    notifyListeners();
  }

  //delete an item from the cart.
  void removeItem(CartItem item){
    _items.remove(item);
    totalPrice -= item.price;

    notifyListeners();
  }

  //method to remove all items from a class
  void removeAll(){
    _items.clear();
    totalPrice = 0;

    notifyListeners();
  }

  //decrementing quantity from cart
  void decrementQuantity(CartItem item){
    int index = _items.indexOf(item);

    //subtract the item price from total price
    totalPrice -= item.price;

    //calculate the unit price before decrementing
    int unitPrice = (item.price / item.quantity).round() ;

    //decrement quantity
    item.quantity --;

    //if decrementing results zero equate to one
    if(item.quantity <= 0){
      item.quantity = 1;
    }

    //calculate and assign the new price
    item.price = unitPrice * item.quantity;

    //add the modified item in the same index
    _items[index] = item;

    //add the new item price to the total price
    totalPrice += item.price;

    //updates done. Notify the listeners
    notifyListeners();
  }

  //incrementing quantity from cart
  void incrementQuantity(CartItem item){
    int index = _items.indexOf(item);

    //subtract the item price from total price
    totalPrice -= item.price;

    //calculate the unit price before decrementing
    int unitPrice = (item.price / item.quantity).round() ;

    //decrement quantity
    item.quantity ++;

    //if decrementing results zero equate to one
    if(item.quantity <= 0){
      item.quantity = 1;
    }

    //calculate and assign the new price
    item.price = unitPrice * item.quantity;

    _items[index] = item;

    //add the new item price to the total price
    totalPrice += item.price;

    //updates done. Notify the listeners
    notifyListeners();
  }



}