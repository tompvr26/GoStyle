import 'package:flutter/material.dart';
import 'package:gostyle/screens/login.dart';
import 'package:gostyle/screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) =>  LoginScreen(),
        '/login': (context) =>  LoginScreen(),
        '/register': (context) =>  RegisterScreen(),
      },
      //home: LoginScreen(),
    );
  }
}