import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gostyle/provider/coupons.dart';
import 'package:gostyle/screens/home_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';


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
          child: Center(
            //margin: EdgeInsets.all(1),
            child: Column(
              children: [
                QrImage(
                  data: code,
                  version: QrVersions.auto,
                  size: 250.0,
                ),
                Text(code),
                ElevatedButton(
                    child: Text("Enregister le coupon"),
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
                        var titre = 'Code déjà existant';
                        var content = "Impossible d'ajouter un coupon déjà existant dans votre liste.";
                        _showMyDialog(titre, content);
                      }
                    }
                )
              ],
            )
          )
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
