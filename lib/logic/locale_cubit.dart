// ignore_for_file: empty_catches

import 'dart:io';

import 'package:flutter/material.dart' show Locale;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  // Passing an initial value (state) with a default 'Locale' to the super class.
  LocaleCubit() : super(const SelectedLocale(Locale('ar')));

  // Once we call this method, the BlocBuilder<LocaleCubit>
  // in the 'main.dart' will rebuild the entire app with
  // the new emitted state that holds the 'ar' locale.
  Future<bool> toArabic({bool syncWithServer = false}) async {
    emit(const SelectedLocale(Locale('ar')));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', 'ar');
    return true;
  }

  // Same as the previous method, but with the 'en' locale.
  Future<bool> toEnglish({bool syncWithServer = false}) async {
    emit(const SelectedLocale(Locale('en')));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', 'en');
    return true;
  }

  //get local
  Future<void> getLocalLang() async {
    String lang;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('locale')) {
      final String defaultLocale = Platform.localeName.substring(0, 2);
      lang = defaultLocale == "en" ? "en" : "ar";
    } else {
      lang = (prefs.getString('locale'))!;
    }
    emit(SelectedLocale(Locale(lang)));
  }
}