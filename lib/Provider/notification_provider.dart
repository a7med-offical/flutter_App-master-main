import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLogin extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  UserLogin() {
    getUserState();
  }
  
  void getUserState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLogin = prefs.getBool('isLoginIn') ?? false;
    notifyListeners();
  }

  void _saveUSerState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoginIn', value);
  }

  void toggleUSerState() {
    _isLogin = !_isLogin;
    _saveUSerState(_isLogin);
    notifyListeners();
  }
}
