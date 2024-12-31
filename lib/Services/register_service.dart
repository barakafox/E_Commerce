import 'package:dio/dio.dart';
import 'package:project_holistic/Models/register.dart';

class RegisterService{
  static Dio dio = Dio();
 static Future<RegisterModel> register(
     {required String name,required String password,required String email, required String phone}) async{
   try{
     Response response = await dio.post(
       'https://student.valuxapps.com/api/register',
       data: {
         "name":name,
         "password": password,
         "email": email,
         "phone": phone,
       },
     );
     if(response.statusCode == 200){
       return RegisterModel.fromjson(response.data);
     }else{
       throw Exception('Field');
     }
   }
   catch(e){
     throw Exception('Error $e');
   }
 }

//////////////////////////////////////////////////////////////////////

  static Future<RegisterModel> login(String email, String password,) async{
    try{
      Response response = await dio.post(
        'https://student.valuxapps.com/api/login',
        data: {
          "email": email,
          "password": password,
        },
      );
      if(response.statusCode == 200){
        return RegisterModel.fromjson(response.data);
      }else{
        throw Exception('Field');
      }
    }
    catch(e){
      throw Exception('Error $e');
    }
  }
}

