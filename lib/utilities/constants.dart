import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final url = 'https://serverapimspr.herokuapp.com';

getUserToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString("token");
  return 'Bearer '+token;
}


getCoupon(String code) async {
  var token = 'Bearer ' + await getUserToken();
  var url = 'serverapimspr.herokuapp.com';

  Map data = {
    'code': code,
  };

  var response = await http.post(
    Uri.https(url, 'mspr/coupon/get'),
    body: data,
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": token
    },
  );
  print(response.body);
}


