import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gostyle/screens/qrcode.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoStyle',
      debugShowCheckedModeBanner: false,
      routes: {
        '/qrcode': (context) => QRScanView(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'GoStyle'),
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
            icon: new Icon(Icons.qr_code),
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pushNamed(context, '/qrcode');
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: new Container(
        // color: Colors.redAccent,
        child: ListView.builder(
          itemCount: coupons.length,
          padding: EdgeInsets.all(30.0),
          itemBuilder: (context, index) {
            // return ListTile(title: Texts(coupons[index].code));
            return Card(
              color: Colors.redAccent,
              elevation: 10,
              child: new Container(
                height: 100,
                // padding: EdgeInsets.all(8),

                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(child: Text(coupons[index].code, textAlign: TextAlign.left)),
                      const IconButton(
                          icon: Icon(Icons.keyboard_arrow_right_rounded),
                          onPressed: null)
                    ],
                  ),
                ),
              );
          },
        ),
      ),

      /*
      ListView.builder(
        itemCount: coupons.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(coupons[index].code));
        },
      ),
      */

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the second screen using a named route.
          Navigator.pushNamed(context, '/qrcode');
        },
        tooltip: 'Increment',
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
