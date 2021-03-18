import 'package:flutter/material.dart';

import '../../screens/login_screen.dart';

class RegisterLoginButtton extends StatelessWidget {

  void gotToLoginScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(LoginScreen.nameRoute,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
          elevation: 5.0,
          onPressed: () => gotToLoginScreen(context),
          padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(
        'Se connecter',
        style: TextStyle(
          color: Colors.black,
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),);
  }
}
