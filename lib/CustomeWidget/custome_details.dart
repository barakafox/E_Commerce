import 'package:flutter/cupertino.dart';

class CustomDetails extends StatelessWidget {
  String urlimage;
  String title;
  String description;
  num price;
  CustomDetails({super.key,required this.urlimage,required this.title,required this.description,required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(urlimage),
        Text(title),
        Text(description),
        Text(price.toString())
      ],
    );
  }
}
