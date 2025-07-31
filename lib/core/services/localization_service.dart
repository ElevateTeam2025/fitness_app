import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider() {
    loadLocale();
  }

  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void changeLocale(Locale locale) async {
    _locale = locale;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);

    notifyListeners();
  }

  Future<void> loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? code = prefs.getString('languageCode');

    if (code == null) {
      _locale = const Locale('en');
    } else {
      _locale = Locale(code);
    }

    notifyListeners();
  }
}
