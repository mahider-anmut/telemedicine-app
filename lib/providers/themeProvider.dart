import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../service/shared_preference.dart';
import '../utils/themes.dart';


class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme = AppTheme.lightTheme;

  ThemeData get theme => _selectedTheme;

  bool get isDarkMode => _selectedTheme == AppTheme.darkTheme;

  ThemeProvider() {
    _loadThemeFromPreferences();
  }

  void _loadThemeFromPreferences() async {

    final isDarkMode = await SharedPreference.getBool(Constants.isDarkMode);

    if (isDarkMode) {
      _selectedTheme = AppTheme.darkTheme;
    } else {
      _selectedTheme = AppTheme.lightTheme;
    }
    notifyListeners();
  }

  void toggleTheme() {
    if (_selectedTheme == AppTheme.lightTheme) {
      _selectedTheme = AppTheme.darkTheme;
      SharedPreference.setBool(Constants.isDarkMode, true);
    } else {
      _selectedTheme = AppTheme.lightTheme;
      SharedPreference.setBool(Constants.isDarkMode, false);
    }
    notifyListeners();
  }
}
