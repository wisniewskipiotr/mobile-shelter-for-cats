import 'package:catadopt/UI/cat_list.dart';
import 'package:flutter/material.dart';

void main()async {

runApp(new CatAdopt());
}


class CatAdopt extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.blueAccent),
      home: new CatList(),
      );

  }


}