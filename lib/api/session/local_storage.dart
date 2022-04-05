import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  static const _accessToken = 'access_token';
  static const _isUserLoggedIn = 'is_user_loggedIn';

  static Future<bool?> getUserStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isUserLoggedIn);
  }

  static Future<void> saveUserStatus(bool isUserLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isUserLoggedIn, isUserLoggedIn);
  }

  static Future<void> deleteUserStatus() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_isUserLoggedIn);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessToken);
  }

  static Future<void> saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_accessToken, token);
  }

  static Future<void> deleteAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_accessToken);
  }
}
