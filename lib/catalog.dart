import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/data/product_details.dart';
import 'package:shopping_cart/provider/product_notifier.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
   
  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue"),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/cart");
              },
              icon: Icon(Icons.shopping_basket),
            ),
          ),
        ],
      ),

      body: ListView.builder(

        itemCount: PRODUCT_DETAILS.length,
        itemBuilder: (context, index) {
          final product = PRODUCT_DETAILS[index];
         

          return Card(
            child: ListTile(
              title: Text(product.name),
              subtitle: Text(product.price),
              trailing: ElevatedButton.icon(onPressed: () {
              productNotifier.addToCart(product);
               
        
              }, 
              icon: Text("Add Item"),
              label: Icon(Icons.add)),
            ),
          );
        },
      ),
    );
  }
}


   // body: GridView.builder(
      //   padding: EdgeInsets.all(16),
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount:
      //         MediaQuery.of(context).orientation == Orientation.portrait
      //         ? 2
      //         : 4,
      //     childAspectRatio: 0.8,
      //     crossAxisSpacing: 12,
      //     mainAxisSpacing: 12,
      //   ),
      //   itemCount: PRODUCT_DETAILS.length,
      //   itemBuilder: (context, index) {
      //     final product = PRODUCT_DETAILS[index];
      //     return Column(
      //       children: [
      //         Card(
      //           child: ListTile(
      //             title: Text(product.name),
      //             subtitle: Text(product.price),
      //           ),
      //         ),
      //         ElevatedButton.icon(onPressed: (){},
      //         style: ElevatedButton.styleFrom(
      //           //fixedSize: Size(40, 44)
      //         ),
      //         icon: Text("Add to cart", style: TextStyle(
      //           color: Colors.blue
      //         ),),
      //         label: Icon(Icons.add))
      //       ],
      //     );
      //   },
      // ),
