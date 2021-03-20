import 'package:flutter/material.dart';
import 'package:gostyle/provider/coupon.dart';
import 'package:gostyle/provider/coupons.dart';
import 'package:gostyle/screens/home_screen.dart';



class CouponDetailsScreen extends StatelessWidget {

  static const nameRoute = '/couponDetail';


  final Coupon coupon;
  CouponDetailsScreen({Key key, @required this.coupon}) : super(key: key);

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