import 'package:flutter/material.dart';


import 'package:gostyle/screens/coupon_details_screen.dart';
import 'package:gostyle/screens/home_screen.dart';
import 'package:gostyle/screens/products_screen.dart';
import 'package:gostyle/screens/login_screen.dart';
import 'package:gostyle/screens/register_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoStyle',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: '',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 1, 1),
            ),
            title: TextStyle(
              fontSize: 24,
              fontFamily: '',
              fontWeight: FontWeight.bold,
            )),
      ),

      initialRoute: HomeScreen.nameRoute,
      routes: {
        LoginScreen.nameRoute: (context) => LoginScreen(),
        RegisterScreen.nameRoute : (context) => RegisterScreen(),
        HomeScreen.nameRoute: (context) => HomeScreen(),
        ProductsScreen.routeName : (context) => ProductsScreen(),
        //CouponDetailsScreen.nameRoute : (context) => CouponDetailsScreen()
      },
      //home: LoginScreen(),
    );
  }
}
