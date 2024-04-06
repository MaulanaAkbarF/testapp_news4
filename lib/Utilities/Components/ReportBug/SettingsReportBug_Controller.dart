import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SettingsReportBugController{
  Stream<QuerySnapshot<Object?>> allReportsFuture = FirebaseFirestore.instance.collection('Reports').snapshots();
  String username = 'username';
  String time = 'time';
  String description = 'description';

  TextEditingController reportController = TextEditingController();
}