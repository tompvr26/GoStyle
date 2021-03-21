import 'package:flutter/material.dart';

class BuildCardListViewSectionProducts extends StatelessWidget {

  final String title;
  final String value;


  BuildCardListViewSectionProducts(this.title, this.value);

  @override
  Widget build(BuildContext context) {
        return Card(
      color: Colors.amber,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(
          '$title : $value',
          style: TextStyle(
              color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
