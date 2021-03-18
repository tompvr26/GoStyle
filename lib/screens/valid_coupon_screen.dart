import 'package:flutter/material.dart';



class ValidCouponScreen extends StatelessWidget {

  static const nameRoute = '/validCoupon';

  final String code;

  ValidCouponScreen({Key key, @required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text((code).toString()),
      ),
    );
  }
}