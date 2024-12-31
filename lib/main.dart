import 'package:flutter/material.dart';
import 'package:project_holistic/Providers/product_provider.dart';
import 'package:project_holistic/Providers/register_providers.dart';
import 'package:project_holistic/Screens/login_screen.dart';
import 'package:project_holistic/Screens/product_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ChangeNotifierProvider(create: (context) => ProductProvider())
    ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E_commerce',
        home: LoginScreen(),
      ),
    );

  }
}
