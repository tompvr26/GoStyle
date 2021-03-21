import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gostyle/provider/Product.dart';
import 'package:gostyle/provider/auth.dart';
import 'package:gostyle/utilities/constants.dart';
import 'package:http/http.dart' as http;
import './coupon.dart';

class Coupons with ChangeNotifier {
  List<Coupon> _items = [];
  String resource = 'mspr/coupon';

  Coupon get item {
    return item;
  }

  List<Coupon> get items {
    return _items;
  }

  Future<void> fetchAllCouponsUser() async {
    String action = '/getall';
    try {
      final extractedData =
      await Future.value(Auth.getDataApi(action, this.resource)) as List<
          dynamic>;

      final List<Coupon> loadedCoupon = [];
      extractedData.forEach((couponData) {
        final extractObject = couponData as Map<String, dynamic>;
        print(extractObject);
        extractObject.forEach((couponId, couponData) {
          loadedCoupon.add(Coupon(
              code: couponData['code'],
              dateDebut: couponData['dateDebut'],
              dateExpiration: couponData['dateExpiration'],
              condition: couponData['condition'],
              reduction: couponData['reduction'].toDouble(),
              product: Product(nom: couponData['Product']['nom'], prix: couponData['Product']['prix'] )
          ));
        });
      });
      _items = loadedCoupon;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Coupon fetchCouponByCode(String code) {
    return _items.firstWhere((element) => code == element.code);
  }
}


/*
 * Rechercher tout les coupons pour  l'utilisateur connecté
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

/*
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
*/

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
