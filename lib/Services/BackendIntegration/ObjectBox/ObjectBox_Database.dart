import 'package:objectbox/objectbox.dart';
import 'ObjectBox_Model.dart';
import 'objectbox.fun.g.dart';

class Database {
  static Future<Box<Article>> openBox() async {
    return store.box<Article>();
  }
}
