import 'package:catsadopt/UI/cat_details/header/header.dart';

import 'package:catsadopt/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter/src/widgets/navigator.dart';

class CatDetailsPage extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  CatDetailsPage(
      this.cat, {
        @required this.avatarTag,
      });

  @override
  _CatDetailsPageState createState() => new _CatDetailsPageState();
}

class _CatDetailsPageState extends State<CatDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = new BoxDecoration(
      gradient: new LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
          colors: [
            Colors.red,
            Colors.red
          ],
      ),
    );


    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          decoration: linearGradient,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new CatDetailHeader(
                  widget.cat,
                  avatarTag: widget.avatarTag,
              ),





            ],
          ),
        ),
      ),
    );
  }
}