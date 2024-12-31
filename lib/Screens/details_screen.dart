import 'package:flutter/material.dart';
import 'package:project_holistic/Screens/product_screen.dart';

class DetailsScreen extends StatelessWidget {
  Product product;
   DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
      child:Column(
          children: [
            Image.network(product.imageurl , width: 100,),
            Text(product.title , style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Text(product.price.toString()),
            SizedBox(height: 25,),
            Text(product.description)
          ]
      ),
      )
    );

  }
}
