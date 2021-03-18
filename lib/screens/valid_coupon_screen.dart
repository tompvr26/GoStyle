import 'package:flutter/material.dart';
import 'package:gostyle/screens/home_screen.dart';



class ValidCouponScreen extends StatelessWidget {

  static const nameRoute = '/couponDetail';


  final String code;
  ValidCouponScreen({Key key, @required this.code}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text((code).toString()),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text((code).toString()),
      ),
    );
  }
}


