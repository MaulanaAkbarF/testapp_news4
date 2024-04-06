import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

class TrendsController{
  static String? languageId;
  late String todayDate;
  String imagePathField = 'urlToImage';
  String titleField = 'title';
  String descField = 'author';

  TrendsController() {
    getTodayDate();
  }

  Future<bool> checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
  }

  Future<void> getTodayDate() async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(now);
    todayDate = formatted;
  }
}