import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_holistic/Providers/register_providers.dart';
import 'package:project_holistic/Screens/product_screen.dart';
import 'package:project_holistic/Screens/signup_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {


   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var providerObject = Provider.of<RegisterProvider>(context);
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
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
                        prefixIcon: Icon(Icons.email)
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
                  SizedBox(height: 35,),

                  OutlinedButton(
                      onPressed: () async{
                        if(_fromkey.currentState!.validate()){
                          await providerObject.login(email.text, password.text);
                          if(providerObject.registerModel?.status == true){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(providerObject.registerModel!.message)));

                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(providerObject.registerModel!.message)));
                          }
                        }
                      },
                      child: Text('Login')
                  ),

                  SizedBox(height: 35,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                  }, child: Text('SignUp'))
                ],
              )
          ),
        );
      },
      ),
    );
  }
}
