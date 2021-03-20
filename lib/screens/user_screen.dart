import 'package:flutter/material.dart';
import 'package:gostyle/models/user.dart';
import 'package:gostyle/screens/login_screen.dart';
import 'package:gostyle/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key key}) : super(key: key);
  static const nameRoute = '/profile';

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileScreen> {
  Future<User> userProfile;
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    userProfile = profilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.logout),
            onPressed: () async {
              sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.clear();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);

            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: userProfile,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Card(
                      color: Colors.redAccent,
                      elevation: 10,
                      child: new Container(
                        height: 50,
                        padding: EdgeInsets.all(15),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(child: Icon(Icons.portrait_rounded)),
                            Expanded(
                                child:
                                Text((snapshot.data.prenom).toUpperCase())),
                            Expanded(
                                child: Text((snapshot.data.nom).toUpperCase())),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.redAccent,
                      elevation: 10,
                      child: new Container(
                        height: 50,
                        padding: EdgeInsets.all(15),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(child: Icon(Icons.alternate_email)),
                            Expanded(
                                child: Text((snapshot.data.email).toUpperCase())),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
