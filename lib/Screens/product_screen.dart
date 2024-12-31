import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CustomeWidget/custome_product.dart';
import '../Providers/product_provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer<ProductProvider>(
          builder: (context, objectProvider, child) {
            var objectModel = objectProvider?.productModel;
            if (objectModel == null) {
              objectProvider.fetchData();
              return CircularProgressIndicator();
            } else {
              return SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: objectModel.product.length,
                  itemBuilder: (context, index) {
                    return CustomProduct(
                      image: objectModel.product[index]['image'],
                      name: objectModel.product[index]['name'],
                      descriptions: objectModel.product[index]['description'],
                      price: objectModel.product[index]['price'],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class Product {
  String imageurl;
  String title;
  String description;
  num price;

  Product({required this.imageurl, required this.title, required this.description, required this.price});
}
