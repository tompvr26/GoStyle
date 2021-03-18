import 'package:flutter/material.dart';

class LoginForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Bouton mdp oublié'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Mot de passe oublié',
        ),
      ),
    );
  }
}
