class DetailsModel{
  List<dynamic> products;

  DetailsModel({required this.products});

  factory DetailsModel.fromjson(Map<String,dynamic> json){
    return DetailsModel(products: json['products']);
  }
}