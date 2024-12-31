import 'package:flutter/cupertino.dart';
import 'package:project_holistic/Models/product_model.dart';
import 'package:project_holistic/Services/product_service.dart';

class ProductProvider extends ChangeNotifier{

  ProductModel? productModel;

  Future<void> fetchData() async {
    try {
      productModel = await ProductService.getData();
      notifyListeners();
    } catch (e) {
      print('Fetch Data Error: $e');
    }
  }
}