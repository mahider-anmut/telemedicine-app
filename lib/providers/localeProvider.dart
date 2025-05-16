import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../service/shared_preference.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  LocaleProvider() {
    _loadLocalFromPreferences();
  }

  void _loadLocalFromPreferences() async {
    String lang = await SharedPreference.getString(Constants.appLang,"en");
    _locale = Locale(lang);
    notifyListeners();
  }

  void setLocale(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      SharedPreference.setString(Constants.appLang, locale.languageCode);
      notifyListeners();
    }
  }
}
