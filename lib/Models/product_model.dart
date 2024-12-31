class ProductModel{
  List<dynamic> product;

  ProductModel({required this.product});

  factory ProductModel.fromjson(Map<String,dynamic> json){
    return ProductModel(product: json["data"]['products']);
  }
}