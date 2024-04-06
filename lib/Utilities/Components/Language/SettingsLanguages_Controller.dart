import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsLanguageController {
  static String languageIdSelected = '';
  final languageBloc = LanguageBloc();

  void saveLanguagePreference(String languageCode, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
    languageBloc.add(RestartAppEvent());
  }
}

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<RestartAppEvent>((event, emit) async {
      emit(LanguageRestart());
    });
  }
}

class LanguageEvent {}

class RestartAppEvent extends LanguageEvent {}

class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageRestart extends LanguageState {}
