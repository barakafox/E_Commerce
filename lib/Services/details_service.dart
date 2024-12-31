import 'package:dio/dio.dart';

import '../Models/details_model.dart';

class DetailsService{
  static Dio dio = Dio();

  static Future<DetailsModel> getData() async{
    try{
      Response response = await dio.get('https://student.valuxapps.com/api/home');
      if(response.statusCode == 200){
        return DetailsModel.fromjson(response.data);
      }else{
        throw Exception('Error');
      }
    }
    catch(e){
      throw Exception("Find $e");
    }
  }
}