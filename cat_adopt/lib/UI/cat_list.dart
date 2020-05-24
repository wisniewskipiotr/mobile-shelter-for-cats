import 'dart:async';
import 'package:catsadopt/UI/cat_details/d_page.dart';
import 'package:catsadopt/service/api.dart';
import 'package:catsadopt/utilities/route.dart';
import 'package:flutter/material.dart';
import 'package:catsadopt/models/cat.dart';
import 'package:catsadopt/service/api.dart';
import 'package:catsadopt/utilities/route.dart';


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
      setState(() {
        _cats = CatApi.CatsList(fileData);
    });
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

  _navigateToDetails(Cat cat, Object avatarTag) {
    Navigator.of(context).push(new FadePageRoute(
        builder: (c) {
          return new CatDetailsPage(cat, avatarTag: avatarTag);
        },
        settings: new RouteSettings(),
      ),
    );
  }


Widget _buildBody() {
    return new Container(
      margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
      child: new Column(
        children: <Widget>[
          _getAppTitleWidget(),
          _getListViewWidget()
        ],
      ),

    );
}

  Widget _buildCatItem(BuildContext context, int index) {
    Cat cat = _cats[index];

    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              onTap:() => _navigateToDetails(cat, index),
              leading: new Hero(
                tag: index,
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(cat.avatarUrl),
                ),
              ),
              title: new Text(
                cat.name,
                style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              subtitle: new Text(cat.description),
              isThreeLine: true, // Less Cramped Tile
              dense: false, // Less Cramped Tile
            ),
          ],
        ),
      ),
    );
  }


Future<Null> refresh() {
    _loadCats();
    return new Future<Null>.value();
}

Widget _getListViewWidget() {
    return new Flexible(
        child: new RefreshIndicator(
          child: new ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: _cats.length,
            itemBuilder: _buildCatItem,
        ),
          onRefresh: refresh)
    );
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.red,
      body:_buildBody(),
    );
  }

}
