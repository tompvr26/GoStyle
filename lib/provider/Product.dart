import 'dart:ffi';

class Product {
  final String id;
  final String nom;
  final double prix;
  final DateTime createAt;
  final DateTime updateAt;

  const Product({this.id, this.nom, this.prix, this.createAt, this.updateAt});
}
