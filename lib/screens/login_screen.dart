import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gostyle/main.dart';
import 'package:gostyle/screens/home_screen.dart';
import 'package:gostyle/screens/register_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {

  static const String nameRoute = '/login';



  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _isLoading = false;




  signIn(String email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': password
    };
    var url = 'serverapimspr.herokuapp.com';
    var jsonResponse = null;
    var response = await http.post(
      Uri.https(url, 'mspr/users/login'),
      body: data,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      //encoding: Encoding.getByName("utf-8")
    );
    if(response.statusCode == 201) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      if(response.statusCode == 403) {
        var title = 'Mot de passe incorrect';
        var content = "Votre mot de passe est incorrect";
        _showMyDialog(title, content);
      }
      if(response.statusCode == 404) {
        var title = 'Utilisateur inexistant';
        var content = "Vous utilisez un identifiant qui n'existe pas";
        _showMyDialog(title, content);
      }
      print(response.body);
    }
  }


  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            controller: emailController,
            //keyboardType: TextInputType.emailAddress,

            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'exemple@exemple.com',
            ),

          ),
        ),
      ],
    );
  }
  Widget _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mot de passe',
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            controller: passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'ex : 8ZHBkSIJ-87AnxS-9SABB',
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildForgotPasswordBtn() {
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
  //A IMPLEMENTER PLUS TARD

  // Widget _buildRememberMeCheckbox() {
  //   return Container(
  //
  //     height: 20.0,
  //     child: Row(
  //       children: <Widget>[
  //         Theme(
  //           data: ThemeData(unselectedWidgetColor: Colors.white),
  //           child: Checkbox(
  //             value: _rememberMe,
  //             checkColor: Colors.green,
  //             activeColor: Colors.white,
  //             onChanged: (value) {
  //               setState(() {
  //                 _rememberMe = value;
  //               });
  //             },
  //           ),
  //         ),
  //         Text(
  //           'Se souvenir de moi',
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /////////////////////////
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.only(top: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: emailController.text == "" || passwordController.text == "" ? null : () {
          setState(() {
            _isLoading = true;
          });
          signIn(emailController.text, passwordController.text);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Connexion',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  Widget _buildGoToRegisterBtn(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new RegisterScreen()),),
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
    );
  }




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
                      Color(0xFFf77b72),
                      Color(0xFFf6685e),
                      Color(0xFFf5554a),
                      Color(0xFFF44336),
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
                  child: _isLoading ? Center(child: CircularProgressIndicator()) : Column(
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
                      _buildEmail(),
                      SizedBox(height: 30.0),
                      _buildPassword(),
                      _buildForgotPasswordBtn(),
                      //_buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildGoToRegisterBtn(),
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

  Future<void> _showMyDialog(title, content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Retour'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}