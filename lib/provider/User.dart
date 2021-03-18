import 'dart:ffi';

class User {
  final String id;
  final String nom;
  final String prenom;
  final String email;
  final String password;
  final DateTime createAt;
  final DateTime updateAt;

  User(
      {this.id,
      this.nom,
      this.prenom,
      this.email,
      this.password,
      this.createAt,
      this.updateAt});
}
