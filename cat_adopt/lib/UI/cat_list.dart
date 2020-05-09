import 'package:catsadopt/service/api.dart';
import 'package:flutter/material.dart';
import 'package:catsadopt/models/cat.dart';
import 'package:catsadopt/service/api.dart';



class CatList extends StatefulWidget {
  @override
  _CatListState createState() => new _CatListState();
}
class _CatListState extends State<CatList> {

  List<Cat> _cats = [];

  @override
  void initState() {
    super.initState();
    _loadCats();
  }

    _loadCats() async {
      String fileData = await DefaultAssetBundle.of(context).loadString("assets/cats.json");
      for (Cat cat in CatApi.CatsList(fileData)){
        _cats.add(cat);
    }
  }

  Widget _getAppTitleWidget() {
    return new Text(
      "Cats",
      style: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 130.0,
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
