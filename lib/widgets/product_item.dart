import 'package:flutter/material.dart';
import 'package:gostyle/screens/coupon_details_screen.dart';

class ProductItem extends StatelessWidget {

  final String id;
  final String nom;
  final double prix;


  final String imageUrl =  "https://meetanentrepreneur.lu/wp-content/uploads/2019/08/profil-linkedin-300x300.jpg";

  void selectCouponDetails(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(CouponDetailsScreens.nameRoute, arguments: {'id': id});
  }


  ProductItem({this.id, this.nom, this.prix});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCouponDetails(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      nom,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money,),
                      SizedBox(width: 6,),
                      Text('$prix €')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
