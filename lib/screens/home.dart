import 'package:flutter/material.dart';
import 'package:gostyle/screens/qrcode.dart';


class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoStyle',
      routes: {
        '/qrcode': (context) =>  QRScanView(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'GoStyle Home'),
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
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),


          ],
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
