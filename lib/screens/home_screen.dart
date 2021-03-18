import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gostyle/provider/Coupon.dart';
import 'package:gostyle/screens/coupon_details_screen.dart';
import 'package:gostyle/screens/qrcode_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String nameRoute = '/home';



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
      home: HomeScreenPage(title: 'Mes réductions'),
    );
  }
}

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}


class _HomeScreenPageState extends State<HomeScreenPage> {
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
                            CouponDetailsScreen(coupon: coupons[index],),
                      ),
                    );
                  },
                  child: new Container(
                    height: 100,
                    padding: EdgeInsets.all(15),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(child: Text(coupons[index].code)),
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
          // Navigate to the second screen using a named route.
          Navigator.pushNamed(context, '/qrcode');
        },
        tooltip: 'Increment',
        child: Icon(Icons.qr_code_outlined),
      ),
    );
  }
}

final coupons = List<Coupon>.generate(
    4,
        (index) => Coupon(id: '98', code: 'IUYZDHZ9', dateDebut: DateTime.now(), dateExpiration: DateTime.now(),
        productId: '8', userId: '2', reduction: 25.0, condition: '', createAt: DateTime.now(), updateAt: DateTime.now()));