import 'package:flutter/material.dart';
import 'package:gostyle/provider/Coupon.dart';
import 'package:gostyle/screens/qrcode_screen.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  static const String nameRoute = '/home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<HomeScreen> {

  Future<Coupon> futureCoupon;

  @override
  void initState() {
    super.initState();
    futureCoupon = fetchCouponsUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes réduction'),
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
        child: FutureBuilder<Coupon>(
          future: futureCoupon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.code);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),




        /*child: ListView.builder(
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
        ),*/
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