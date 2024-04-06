import 'package:objectbox/objectbox.dart';
import 'objectbox.g.dart';

final store = Store(getObjectBoxModel());

// Jalankan perintah: flutter pub run build_runner build
// di terminal, untuk membuat fungsi getObjectBoxModel()