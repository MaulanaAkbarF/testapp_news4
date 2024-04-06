import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../Utilities/Components/Language/UserLanguages.dart';

class DashboardController{
  static String? languageId;
  late String todayDate;
  String imagePathField = 'urlToImage';
  String titleField = 'title';
  String descField = 'author';

  DashboardController() {
    getTodayDate();
  }

  Future<void> getTodayDate() async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(now);
    todayDate = formatted;
  }
}