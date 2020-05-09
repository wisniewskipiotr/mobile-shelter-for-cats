import 'dart:convert';
import 'package:catsadopt/models/cat.dart';

class CatApi {
  static List<Cat> CatsList(String jsonData) {
    List<Cat> cats = [];
    json.decode(jsonData)['cats'].forEach((cat) => cats.add(_forMap(cat)));
    return cats;

  }
    static Cat _forMap(Map<String, dynamic> map) {
      return new Cat(
        externalId: map['id'],
        name: map['name'],
        description: map['description'],
        avatarUrl: map['iamge_url'],
        location: map['location'],
        isAdopted: map['adopted'],
        photos: new List <String>.from(map['photos']),

      );
    }

}