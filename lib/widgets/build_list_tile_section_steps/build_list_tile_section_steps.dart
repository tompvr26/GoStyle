import 'package:flutter/material.dart';

class BuildListTileSectionsSteps extends StatelessWidget {

  final String numberStep;
  final String description;


  BuildListTileSectionsSteps(this.numberStep, this.description);

  @override
  Widget build(BuildContext context) {
        return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Text('# $numberStep'),
      ),
      title: Text(
        description,
      ),
    );
  }
}
