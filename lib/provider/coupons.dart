import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gostyle/utilities/constants.dart';
import 'package:http/http.dart' as http;
import './coupon.dart';

class Coupons with ChangeNotifier {
  List<Coupon> _items = [];

  List<Coupon> get items {
    return _items;
  }

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else {
      return value.toDouble;
    }
  }

  Future<void> fetchAllCouponsUser() async {
    var token = await getUserToken();
    var url = 'serverapimspr.herokuapp.com';
    var uri = 'mspr/coupon/getall';
    try {
      final response = await http.get(
        Uri.https(url, uri),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": token
        },
      );
      final List<dynamic> extractedData = json.decode(response.body);
      final List<Coupon> loadedCoupon = [];
      extractedData.forEach((couponData) {
        final extractObject = couponData as Map<String, dynamic>;
        extractObject.forEach((couponId, couponData) {
          loadedCoupon.add(Coupon(
              code: couponData['code'],
              dateDebut: couponData['dateDebut'],
              dateExpiration: couponData['dateExpiration'],
              condition: couponData['condition']));
        });
      });
      _items = loadedCoupon;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}

/*
 * Rechercher tout les coupons pour  l'utilisateur connecté
 */
/*
getAllCouponsUser() async {
  var token = await getUserToken();
  var url = 'serverapimspr.herokuapp.com';
  var uri = 'mspr/coupon/getall';

  final response = await http.get(
    Uri.https(url, uri),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": token
    },
  );

  final jsonresponse = json.decode(response.body);

  if (response.statusCode == 200) {
    print(jsonresponse);
    return jsonresponse;
  } else {
    throw Exception('Failed to load post');
  }
}

 */

/*
 * Rechercher un coupon par son code
 * Permet de vérifier si un code existe
 * fonctionnelle --
 */
getValidationCoupon(String code) async {
  var token = await getUserToken();
  var url = 'serverapimspr.herokuapp.com';

  Map<String, String> data = {
    'code': code,
  };

  var response = await http.get(
    Uri.https(url, 'mspr/coupon/get', data),
    headers: {
      "Content-Type": "application/json",
      "Authorization": token,
    },
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

getInformationCoupon(String code) async {
  var token = await getUserToken();
  var url = 'serverapimspr.herokuapp.com';

  Map<String, String> data = {
    'code': code,
  };

  var response = await http.get(
    Uri.https(url, 'mspr/coupon/get', data),
    headers: {
      "Content-Type": "application/json",
      "Authorization": token,
    },
  );

  final jsonresponse = json.decode(response.body);

  if (response.statusCode == 200) {
    print(jsonresponse);
    return jsonresponse;
  } else {
    return false;
  }
}

associationCouponUser(String code) async {
  var token = await getUserToken();
  var url = 'serverapimspr.herokuapp.com';

  Map<String, String> data = {
    'code': code,
  };

  var response = await http.post(
    Uri.https(url, 'mspr/coupon/createAssociation'),
    body: data,
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": token,
    },
  );

  final jsonresponse = json.decode(response.body);

  if (response.statusCode == 201) {
    print(jsonresponse);
    print('asso passer');
    return true;
  } else {
    return false;
  }
}
