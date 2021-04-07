import 'package:flutter/material.dart';
import 'package:gostyle/provider/Product.dart';

class Coupon with ChangeNotifier {
  final String id;
  final String code;
  final String dateDebut;
  final String dateExpiration;
  final int productId;
  final int userId;
  final double reduction;
  final String condition;
  final DateTime createAt;
  final DateTime updateAt;
  final Product product;

  Coupon(
      {this.id,
      this.code,
      this.dateDebut,
      this.dateExpiration,
      this.productId,
      this.userId,
      this.reduction,
      this.condition,
      this.product,
      this.createAt,
      this.updateAt});
}
