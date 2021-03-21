import 'package:flutter/material.dart';

class BuildSectionTitle extends StatelessWidget {
  final String title;

  BuildSectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );
  }
}
