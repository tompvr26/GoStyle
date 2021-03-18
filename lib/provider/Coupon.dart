import 'dart:ffi';

class Coupon{

  final String id;
  final String code;
  final DateTime dateDebut;
  final DateTime dateExpiration;
  final String productId;
  final String userId;
  final double reduction;
  final String condition;
  final DateTime createAt;
  final DateTime updateAt;

  const Coupon(
      {this.id,
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