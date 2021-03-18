import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gostyle/widgets/coupon_item.dart';

import '../database.dart';

class CouponsScreen extends StatelessWidget {

  static const String nameRoute = '/coupons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page ou y a les produits avec des promotion')),
      body: GridView(
          padding: const EdgeInsets.all(25),
          children: COUPONS.map((coupon) => CouponItem(coupon.code, coupon.id, coupon.productId)).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}
