import 'package:flutter/material.dart';

class Coupon  with ChangeNotifier {
  final String id;
  final String code;
  final String dateDebut;
  final String dateExpiration;
  final int productId;
  final int userId;
  final int reduction;
  final String condition;
  final DateTime createAt;
  final DateTime updateAt;

  Coupon({ this.id,
    this.code,
    this.dateDebut,
    this.dateExpiration,
    this.productId,
    this.userId,
    this.reduction,
    this.condition,
    this.createAt,
    this.updateAt});
}