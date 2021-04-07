import 'package:flutter/material.dart';
import 'package:gostyle/provider/coupons.dart';
import 'package:gostyle/widgets/build_list_tile_section_steps/build_card_list_view_section_products.dart';
import 'package:gostyle/widgets/build_list_tile_section_steps/build_container.dart';
import 'package:gostyle/widgets/build_list_tile_section_steps/build_list_tile_section_steps.dart';
import 'package:gostyle/widgets/build_list_tile_section_steps/build_section_title.dart';
import 'package:provider/provider.dart';

class CouponDetailsScreen extends StatelessWidget {
  static const nameRoute = '/couponDetail';

  @override
  Widget build(BuildContext context) {
    final code = ModalRoute.of(context).settings.arguments as String;
    final coupon = Provider.of<Coupons>(context).fetchCouponByCode(code);
    final imageUrl = "https://fr.web.img5.acsta.net/pictures/20/03/18/15/21/3002678.jpg";


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
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            BuildSectionTitle(coupon.product.nom),
            BuildContainer(ListView(
              children: <Widget>[
                BuildCardListViewSectionProducts(
                    'prix', '${coupon.product.prix.toString()}€'),
                BuildCardListViewSectionProducts(
                    'reduction', '${((coupon.reduction).round())}%'),
                BuildCardListViewSectionProducts('code', coupon.code)
              ],
            )),
            BuildSectionTitle('STEPS'),
            BuildContainer(ListView(
              children: <Widget>[
                BuildListTileSectionsSteps('1', 'Allez sur le site de GoStyle'),
                BuildListTileSectionsSteps('2', 'Allez sur  sur la page du produit'),
                BuildListTileSectionsSteps('3', 'Entrez le code de promotion'),
                BuildListTileSectionsSteps('4', 'La reduction est à vous !'),
                Divider()
              ],
            )),
          ],
        ),
      ),
    );
  }
}
