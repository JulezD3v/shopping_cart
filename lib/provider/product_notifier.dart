import 'package:flutter/material.dart';
import 'package:shopping_cart/model/product.dart';

class ProductNotifier extends ChangeNotifier{
 
  List<Product> cartItem = [];

 void addToCart(Product productItem){
    cartItem.add(productItem);
      //print(cartItem.length);
      notifyListeners();
  }

  List<Product> updateCart(){
    return cartItem;
  }

  String cartNumber(){
    String length= cartItem.length.toString();
    return length;
  }

}