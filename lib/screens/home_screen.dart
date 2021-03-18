//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gostyle/screens/coupon_screen.dart';
import 'package:gostyle/screens/qrcode_screen.dart';
import 'package:gostyle/utilities/constants.dart';


class HomeScreen extends StatelessWidget {
  static const String nameRoute = '/home';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoStyle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Mes réductions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.camera_alt_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QRScanView()),
              );
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: new Container(
        // color: Colors.redAccent,
        child: ListView.builder(
          itemCount: coupons.length,
          padding: EdgeInsets.all(10.0),
          itemBuilder: (context, index) {
            // return ListTile(title: Texts(coupons[index].code));
            return Card(
                color: Colors.redAccent,
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.push( context, MaterialPageRoute(
                        builder: (context) =>
                            CouponDetailsScreen(coupon: coupons[index]),
                      ),
                    );
                  },
                  child: new Container(
                    height: 100,
                    padding: EdgeInsets.all(15),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: Text(coupons[index].code,
                                textAlign: TextAlign.left)),
                        const Icon(Icons.keyboard_arrow_right_rounded),
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QRScanView()),
          );
        },
        tooltip: 'Scan QrCode',
        child: Icon(Icons.qr_code_outlined),
      ),
    );
  }




}




class Coupon {
  final double reduction;
  final String code;
  final DateTime dateExpiration;
  final DateTime dateDeCreation;
  final String condition;

  /*
  final String idProduit;
  final String idUser;
   */

  Coupon(
    this.reduction,
    this.code,
    this.dateExpiration,
    this.dateDeCreation,
    this.condition,
    /*this.idProduit, this.idUser*/
  );
}

final coupons = List<Coupon>.generate(
    4,
    (index) =>
        Coupon(25.0, 'XZE3PJ$index', DateTime.now(), DateTime.now(), '$index'));
