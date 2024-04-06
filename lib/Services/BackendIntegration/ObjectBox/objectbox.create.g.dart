import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'objectbox.g.dart';

Future<Store> openStore() async {
  final docsDir = await getApplicationDocumentsDirectory();
  return Store(getObjectBoxModel(), directory: '${docsDir.path}/objectbox');
}

// Jalankan perintah: flutter pub run build_runner build
// di terminal, untuk membuat openStore()