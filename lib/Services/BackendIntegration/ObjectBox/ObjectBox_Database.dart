import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'ObjectBox_Model.dart';
import 'objectbox.g.dart';

class Database {
  late final Store _store;
  late final Box<Article> _articleBox;

  Database(this._store) {
    _articleBox = _store.box<Article>();
  }

  static Future<Database> create(Store store) async {
    return Database(store);
  }

  void saveArticle(Article article) {
    _articleBox.put(article);
  }

  List<Article> getAllArticles() {
    return _articleBox.getAll();
  }
}

class ObjectBoxInstance {
  static final ObjectBoxInstance _instance = ObjectBoxInstance._internal();

  late final Store _store;

  factory ObjectBoxInstance() {
    return _instance;
  }

  ObjectBoxInstance._internal();

  Future<void> init() async {
    final docsDir = await getApplicationDocumentsDirectory();
    _store = await openStore(directory: '${docsDir.path}/objectbox');
  }

  Store get store => _store;
}
