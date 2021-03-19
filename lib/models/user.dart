import 'package:flutter/cupertino.dart';
import 'package:gostyle/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class User {
  final int id;
  final String prenom;
  final String nom;
  final String email;
  final String createdAt;

  User({this.id, this.prenom, this.nom, this.email,  this.createdAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      prenom: json['prenom'],
      nom: json['nom'],
      email: json['email'],
      createdAt: json['createdAt'],
    );
  }
}

Future<User> profilData() async {
  var token = await getUserToken();
  var url = 'serverapimspr.herokuapp.com';
  var uri = 'mspr/users/me';

  final response = await http.get(
    Uri.https(url, uri),
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": token
    },
  );
  if (response.statusCode == 201) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}