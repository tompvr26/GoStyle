import 'package:flutter/material.dart';
import 'package:gostyle/widgets/product_item.dart';

import '../database.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = '/products_coupon';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String productId = routeArgs['productId'];

    final couponProducts = PRODUCTS.where((product) {
      print(product.id == productId);
      print(product.id);
      print(productId);
      return product.id == productId;
    }).toList();


    return Scaffold(
      appBar: AppBar(title: Text('Produits associé à un coupons')),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ProductItem(
            id: couponProducts[index].id,
            nom: couponProducts[index].nom,
            prix: couponProducts[index].prix,
          );
        },
        itemCount: couponProducts.length,
      ),
    );
  }
}
