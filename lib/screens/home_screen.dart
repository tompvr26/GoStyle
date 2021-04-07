import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './coupon_screen.dart';
import '../provider/coupons.dart';
import '../screens/qrcode_screen.dart';
import '../screens/user_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String nameRoute = '/home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  var _isInit = true;

  final String coupons;


  _MyHomePageState({this.coupons});

  @override
  void didChangeDependencies() {
    if (_isInit || Provider.of<Coupons>(context).items.isEmpty) {
      Provider.of<Coupons>(context).fetchAllCouponsUser();
    }

    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final couponData = Provider.of<Coupons>(context);
    final coupons = couponData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mes réductions'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.camera_alt_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QRScanView()),
              );
            },
          ),
          new IconButton(
            icon: new Icon(Icons.person_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
          child: ListView.builder(
        itemCount: coupons.length,
        padding: EdgeInsets.all(10.0),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: coupons[index],
            child: Card(
                color: Colors.redAccent,
                elevation: 10,
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                      CouponDetailsScreen.nameRoute,
                      arguments: coupons[index].code),
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.all(15),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: Text(coupons[index].product.nom +'  /  '+ (coupons[index].reduction).toString()+'%',
                                textAlign: TextAlign.left)),
                        const Icon(Icons.keyboard_arrow_right_rounded),
                      ],
                    ),
                  ),
                ))),
      )),
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
