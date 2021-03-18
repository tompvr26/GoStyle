import 'package:flutter/material.dart';
import 'package:gostyle/screens/login_screen.dart';

class LoginRegisterButton extends StatelessWidget {

  void gotToScreenRegister(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(LoginScreen.nameRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25.0),
      width: double.infinity,
      child: InkWell(
        onTap: () => gotToScreenRegister(context),
        child: RaisedButton(
          elevation: 5.0,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Text(
            "S'inscrire",
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }
}
