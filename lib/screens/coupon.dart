import 'package:flutter/material.dart';
import 'package:gostyle/screens/home.dart';



class CouponDetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Coupon coupon;

  // In the constructor, require a Todo.
  CouponDetailScreen({Key key, @required this.coupon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(coupon.code),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text((coupon.reduction).toString()),
      ),
    );
  }
}