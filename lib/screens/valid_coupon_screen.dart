import 'package:flutter/material.dart';
import 'package:gostyle/provider/coupons.dart';
import 'package:gostyle/screens/home_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:gostyle/utilities/constants.dart';

class ValidCouponScreen extends StatefulWidget {
  static const nameRoute = '/couponDetail';
  final String code;

  ValidCouponScreen({Key key, @required this.code}) : super(key: key);

  @override
  _ValidCouponScreen createState() => _ValidCouponScreen(code: this.code);
}



class _ValidCouponScreen extends State<ValidCouponScreen> {
  final String code;

  _ValidCouponScreen({@required this.code});


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text('Code valide'),
      ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(1),
                  child: ElevatedButton(
                    //SI le boutton es presser alors tu execute la fonction
                      onPressed: () async {
                        if (await associationCouponUser(code)) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        } else {
                          _showMyDialog();
                        }
                      }
                  )
              )
            ],
          ),
        ),
    );
  }





  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Code déjà ajouté'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Imposible d'ajouter un doublon."),
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
