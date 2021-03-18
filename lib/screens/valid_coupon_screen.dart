import 'package:flutter/material.dart';



class ValidCouponScreen extends StatelessWidget {

  static const nameRoute = '/validCoupon';

  final String code;
  ValidCouponScreen({Key key, @required this.code}) : super(key: key);






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vérification'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text((code).toString()),
      ),
    );
  }
}