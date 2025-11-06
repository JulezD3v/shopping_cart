import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart.dart';
import 'package:shopping_cart/catalog.dart';
import 'package:shopping_cart/provider/product_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // added provider state management at the root
      create: (context) => ProductNotifier(),
      child: MaterialApp(
        title: 'Shopping cart',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          "/catalogue": (context) => Catalog(),
          "/cart": (context)  => Cart(),},

        initialRoute: "/catalogue"

        //home: Catalog(),
      ),
    );
  }
}

