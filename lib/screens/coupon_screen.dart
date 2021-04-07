import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gostyle/provider/coupons.dart';
import 'package:gostyle/widgets/build_list_tile_section_steps/build_card_list_view_section_products.dart';
import 'package:gostyle/widgets/build_list_tile_section_steps/build_container.dart';
import 'package:gostyle/widgets/build_list_tile_section_steps/build_list_tile_section_steps.dart';
import 'package:gostyle/widgets/build_list_tile_section_steps/build_section_title.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';



class CouponDetailsScreen extends StatelessWidget {
  static const nameRoute = '/couponDetail';


  @override
  Widget build(BuildContext context) {
    final code = ModalRoute.of(context).settings.arguments as String;
    final coupon = Provider.of<Coupons>(context).fetchCouponByCode(code);
    final prixRedus = NumberFormat.currency(locale: "fr_FR", symbol: "€").format(coupon.product.prix - (coupon.product.prix * coupon.reduction));

    return Scaffold(
      appBar: AppBar(
        title: Text('${coupon.product.nom}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Center(
                child: QrImage(
                  data: coupon.code,
                  version: QrVersions.auto,
                  size: 250.0,
                ),
              )
            ),
            BuildSectionTitle(coupon.product.nom),
            BuildContainer(ListView(
              children: <Widget>[
                BuildCardListViewSectionProducts(
                    'Prix', '${coupon.product.prix.toString()}€'),
                BuildCardListViewSectionProducts(
                    'Réduction', '${((coupon.reduction))}%'),
                BuildCardListViewSectionProducts('Code', coupon.code),
                BuildCardListViewSectionProducts('Prix réduit', '$prixRedus')
              ],
            )),
            BuildSectionTitle('STEPS'),
            BuildContainer(ListView(
              children: <Widget>[
                BuildListTileSectionsSteps('1', 'Allez sur le site de GoStyle'),
                BuildListTileSectionsSteps('2', 'Allez sur  sur la page du produit'),
                BuildListTileSectionsSteps('3', 'Entrez le code de promotion'),
                BuildListTileSectionsSteps('4', 'La reduction est à vous !'),
                Divider(),
                BuildListTileSectionsSteps('1', 'Scannez-le au magasin'),

              ],
            )),
          ],
        ),
      ),
    );
  }
}

