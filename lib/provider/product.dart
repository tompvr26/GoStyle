import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final String nom;
  final double prix;
  final DateTime createAt;
  final DateTime updateAt;

  Product({this.id, this.nom, this.prix, this.createAt, this.updateAt});
}
