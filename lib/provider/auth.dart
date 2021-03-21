import 'dart:convert';

import 'package:gostyle/utilities/constants.dart';
import 'package:http/http.dart' as http;

class Auth {
  static const baseUrl = 'serverapimspr.herokuapp.com';

  static Future<Map<String, String>> get _headers async {
    return {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": await getUserToken()
    };
  }

  static getDataApi(String action, String resource,
      {Map<String, String> data}) async {
    var result;
    if (data != null) {
      result = _getDataApi(action, resource, data: data);
    } else {
      result = _getDataApi(action, resource);
    }
    return result;
  }

  static Future<dynamic> _getDataApi(String action, String resource,
      {Map<String, String> data}) async {
    var response;
    if (data != null) {
      response = await http.get(Uri.https(baseUrl, '$resource$action', data),
          headers: await Future.value(_headers));
    } else {
      response = await http.get(Uri.https(baseUrl, '$resource$action'),
          headers: await Future.value(_headers));
    }
    return json.decode(response.body);
  }
}
