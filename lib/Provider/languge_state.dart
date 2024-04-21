import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  bool _isArabic = false;

  bool get isArabic => _isArabic;
  
  ThemeProvider() {
    _loadTheme();
  }
  
  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isArabic = prefs.getBool('islanguge') ?? false;
    notifyListeners();
  }

  void _saveTheme(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('islanguge', isDarkMode);
  }

  void toggleTheme() {
    _isArabic = !_isArabic;
    _saveTheme(_isArabic);
    notifyListeners();
  }
}
