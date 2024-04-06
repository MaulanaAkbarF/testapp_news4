import 'package:objectbox/objectbox.dart';

@Entity()
class Article {
  int id;
  String urlToImage;
  String title;
  String description;

  Article({required this.id, required this.urlToImage, required this.title, required this.description});
}
