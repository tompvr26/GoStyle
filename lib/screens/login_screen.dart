import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/UXLogin/login_button.dart';
import '../widgets/UXLogin/login_forgot_password_button.dart';
import '../widgets/UXLogin/login_input_email.dart';
import '../widgets/UXLogin/login_input_password.dart';
import '../widgets/UXLogin/login_register_button.dart';

class LoginScreen extends StatelessWidget {

  static const String nameRoute = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF96FB80),
                      Color(0xFF78FF5B),
                      Color(0xFF5DFF39),
                      Color(0xFF34F20A),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'GoStyleee',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      LoginInputEmail(),
                      SizedBox(height: 30.0),
                      LoginInputPassword(),
                      LoginForgotPasswordButton(),
                      LoginButton(),
                      LoginRegisterButton(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
