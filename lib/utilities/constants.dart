import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



getUserToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString("token");
  return token;
}

getAllCoupon() async {
  var token = 'Bearer '+await getUserToken();
  var url = 'serverapimspr.herokuapp.com';

  var response = await http.get(
    Uri.https(url, 'mspr/coupon/getAll'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization" : token
    },
    //encoding: Encoding.getByName("utf-8")
  );
  print(json.decode(response.body));
  print(DateTime.now());

}



getCoupon() async {
  var token = 'Bearer '+await getUserToken();
  var url = 'serverapimspr.herokuapp.com';

  var response = await http.get(
    Uri.https(url, 'mspr/coupon/getAll'),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization" : token
    },
    //encoding: Encoding.getByName("utf-8")
  );
  print(DateTime.now());
}