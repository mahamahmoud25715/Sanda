import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  bool isDark = false;

  ThemeMode get themeMode =>
      isDark ? ThemeMode.dark : ThemeMode.light;

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('isDark') ?? false;
    notifyListeners();
  }

  Future<void> toggleTheme(bool value) async {
    isDark = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);

    notifyListeners(); // 👈 مهم جدًا
  }
}