import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gostyle/screens/products_screen.dart';

class CouponItem extends StatelessWidget {
  final String id;
  final String code;
  final String productId;


  CouponItem(this.code, this.id, this.productId); // final String reduction;

  void selectCoupon(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(ProductsScreen.routeName, arguments: {'id': id, 'productId': productId});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCoupon(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          code,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pink.withOpacity(0.7),
                Colors.pink.withOpacity(0.7)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
