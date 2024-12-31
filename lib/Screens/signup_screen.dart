import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_holistic/Screens/login_screen.dart';
import 'package:provider/provider.dart';
import '../Providers/register_providers.dart';

class SignupScreen extends StatelessWidget {
  
   SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var providerObject = Provider.of<RegisterProvider>(context);
    TextEditingController email = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController phone = TextEditingController();
    final _fromkey = GlobalKey<FormState>();
    
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<RegisterProvider>(builder: (context, value, child){
        return Container(
          child: Form(
              key: _fromkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(Icons.email_sharp)
                    ),
                    controller: email,
                    obscureText: false,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Your Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(Icons.lock)
                    ),
                    controller: password,
                    obscureText: true,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25,),

                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(Icons.supervised_user_circle)
                    ),
                    controller: name,
                    obscureText: false,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 25,),

                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Phone',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        prefixIcon: Icon(Icons.supervised_user_circle)
                    ),
                    controller: phone,
                    obscureText: false,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Phone';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 35,),
                  
                  OutlinedButton(
                      onPressed: () async{
                        if(_fromkey.currentState!.validate()){
                          await providerObject.signup(email: email.text,name: name.text,password: password.text,phone: phone.text);
                          if(providerObject.registerModel?.status == true){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(providerObject.registerModel!.message)));

                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(providerObject.registerModel!.message)));
                          }
                        }
                      },
                      child: Text('SignUp')
                  ),
                ],
              )
          ),
        );
      },
      ),
    );
  }
}
