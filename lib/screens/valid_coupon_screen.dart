import 'package:flutter/material.dart';
import 'package:gostyle/provider/Coupon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:gostyle/utilities/constants.dart';

class ValidCouponScreen extends StatefulWidget {
  static const nameRoute = '/couponDetail';
  final String code;

  ValidCouponScreen({Key key, @required this.code}) : super(key: key);

  @override
  _ValidCouponScreen createState() => _ValidCouponScreen(code: this.code);
}



class _ValidCouponScreen extends State<ValidCouponScreen> {
  final String code;

  _ValidCouponScreen({@required this.code});


  @override
  void initState() {
    super.initState();
    getInformationCoupon(code);
  }


  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text('Code valide'),
      ),
        body: Container(),
    );
  }









}
