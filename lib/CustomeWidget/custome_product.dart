import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/details_screen.dart';
import '../Screens/product_screen.dart';

class CustomProduct extends StatelessWidget {
  final String image;
  final String name;
  final String descriptions;
  final num price;
  CustomProduct({super.key,
    required this.image,
    required this.name,
    required this.descriptions,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: Product(imageurl: image, title: name, description: descriptions, price: price),
                      ),
                    ),
                  );
                },
                child: Image.network(image , width: 70, height: 50,),
              ),
              SizedBox(height: 40),
              Text(name),
              SizedBox(height: 25,),
              Text(price.toString())// Display the price
            ],
          ),
        ),
      ],
    );
  }
}
