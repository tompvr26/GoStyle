import 'package:flutter/material.dart';
import 'package:gostyle/screens/login_screen.dart';
import 'package:gostyle/screens/qrcode_screen.dart';
import 'package:gostyle/screens/register_screen.dart';
import 'package:gostyle/screens/home_screen.dart';
import 'package:gostyle/screens/user_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './provider/coupons.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: Coupons()
        )
      ],
      child: MaterialApp(
        title: 'Flutter Login UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),


        initialRoute: LoginScreen.nameRoute,
        routes: {
          LoginScreen.nameRoute: (context) => LoginScreen(),
          RegisterScreen.nameRoute : (context) => RegisterScreen(),
          HomeScreen.nameRoute: (context) => HomeScreen(),
          QRScanView.nameRoute: (context) => QRScanView(),
          UserProfileScreen.nameRoute: (context) => UserProfileScreen(),
        },
        //home: LoginScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainScreen> {

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Code Land", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(child: Text("Main Page")),
      drawer: Drawer(),
    );
  }
}