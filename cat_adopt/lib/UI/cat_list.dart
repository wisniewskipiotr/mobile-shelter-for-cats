import 'package:flutter/material.dart';



class CatList extends StatefulWidget {
  @override
  _CatListState createState() => new _CatListState();
}
class _CatListState extends State<CatList> {

  Widget _getAppTitleWidget() {
    return new Text(
      "Cats",
      style: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
          fontSize: 42.0,
      ),
    );

  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.red,
      body: _getAppTitleWidget(),
    );
  }

}
