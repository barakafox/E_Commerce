import 'package:flutter/cupertino.dart';
import 'package:project_holistic/Models/register.dart';
import 'package:project_holistic/Services/register_service.dart';

class RegisterProvider extends ChangeNotifier{
RegisterModel? registerModel;
 signup({required String name,required String password,required String email,required String phone}) async{
   registerModel = await RegisterService.register(name: name,password: password,email: email,phone: phone);
        notifyListeners();
  }

 login(String email, String password) async{
   registerModel = await RegisterService.login(email, password);
    notifyListeners();
  }
}