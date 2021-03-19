import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gostyle/utilities/constants.dart';
import 'package:http/http.dart' as http;

class Coupon {
  final int id;
  final String code;
  final DateTime dateDebut;
  final DateTime dateExpiration;
  final int productId;
  final int userId;
  final double reduction;
  final String condition;
  final DateTime createAt;
  final DateTime updateAt;

  Coupon(
      { this.id,
       this.code,
       this.dateDebut,
       this.dateExpiration,
       this.productId,
       this.userId,
       this.reduction,
       this.condition,
       this.createAt,
       this.updateAt});


  /*factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      id: json['id'],
      code: json['code'].toString(),
      dateDebut: json['dateDebut'],
      dateExpiration: json['dateExpiration'],
      productId: json['productId'],
      userId: json['userId'],
      reduction: json['reduction'],
      condition: json['condition'],
      createAt: json['createAt'],
      updateAt: json['updateAt'],
    );
  }*/

}

fetchCouponsUser() async {
  var token = await getUserToken();
  var url = 'serverapimspr.herokuapp.com';
  var uri = 'mspr/coupon/getAll';


  final response = await http.get(
    Uri.https(url, uri),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": token
    },
  );

  final jsonresponse = json.decode(response.body) as List;

  if (response.statusCode == 200) {
    return jsonresponse;
  } else {
    throw Exception('Failed to load post');
  }
}