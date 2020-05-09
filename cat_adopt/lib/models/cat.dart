
import 'package:meta/meta.dart';


class Cat {
  final int externalId;
  final String name;
  final List<String> photos;
  final String description;
  final String avatarUrl;
  final String location;
  final bool isAdopted;

  Cat({
    @required this.externalId,
    @required this.name,
    @required this.photos,
    @required this.description,
    @required this.avatarUrl,
    @required this.location,
    @required this.isAdopted,


  });
}