import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../Utilities/Components/Language/UserLanguages.dart';

class DashboardController{
  static String? languageId;
  late String todayDate;
  Stream<QuerySnapshot<Object?>> diseaseFuture = FirebaseFirestore.instance.collection('Monitoring').snapshots();
  String value = 'data';
  String indicator = 'indicator';
  String condition = 'condition';
  String conditioninfo = 'conditioninfo';

  DashboardController() {
    getTodayDate();
  }

  Future<void> getTodayDate() async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(now);
    todayDate = formatted;
  }

  void loadLanguage() async {
    languageId = LanguageSelected.selectedLanguage;
    if (languageId == 'id'){
      diseaseFuture = FirebaseFirestore.instance.collection('Monitoring').snapshots();
      value = 'data';
      indicator = 'indicator';
      condition = 'condition';
      conditioninfo = 'conditioninfo';
    } else if (languageId == 'en'){
      diseaseFuture = FirebaseFirestore.instance.collection('MonitoringEN').snapshots();
      value = 'data';
      indicator = 'indicator';
      condition = 'condition';
      conditioninfo = 'conditioninfo';
    } else if (languageId == 'jp'){
      diseaseFuture = FirebaseFirestore.instance.collection('MonitoringJP').snapshots();
      value = 'data';
      indicator = 'indicator';
      condition = 'condition';
      conditioninfo = 'conditioninfo';
    } else {
      print('Tidak ada ID yang terdeteksi');
    }
  }
}