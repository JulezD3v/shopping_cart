import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/data/product_details.dart';
import 'package:shopping_cart/model/product.dart';
import 'package:shopping_cart/provider/product_notifier.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CatalogState();
}

class _CatalogState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_basket),
            ),
          ),
        ],
      ),

      body: ListView.builder(

        itemCount: PRODUCT_DETAILS.length,
        itemBuilder: (context, index) {
          //final product = PRODUCT_DETAILS[index];
          List<Product> updatedCart = productNotifier.updateCart();
          final product = updatedCart[index];
         

          return Card(
            child: ListTile(
             title: Text(product.name),
              subtitle: Text(product.price),
             
            ),
          );
        },
      ),
    );
  }
}