import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gostyle/screens/login.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

void _launchLink() async {
  const url = "https://serverapimspr.herokuapp.com/mspr/users/login";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Impossible de se connecter à l'API.";
  }
}


class _RegisterScreenState extends State<RegisterScreen> {
  bool _rememberMe = false;

  Widget _buildNom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nom',
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,

            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              hintText: 'Bernard',
            ),

          ),
        ),
      ],
    );
  }

  Widget _buildPrenom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nom',
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,

            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              hintText: 'TAPIE',
            ),

          ),
        ),
      ],
    );
  }

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
            keyboardType: TextInputType.emailAddress,

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
              hintText: 'motdepasse123',
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.only(top: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => _launchLink(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Créer un compte',
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

  Widget _buildGoToLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginScreen()),),
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
                        'Créer un compte',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildNom(),
                      SizedBox(height: 10.0),
                      _buildPrenom(),
                      SizedBox(height: 10.0),
                      _buildEmail(),
                      SizedBox(height: 10.0),
                      _buildPassword(),
                      _buildRegisterBtn(),
                      _buildGoToLoginBtn(),
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