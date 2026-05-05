import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends ChangeNotifier {
  String lang = "ar";

  Future<void> loadLang() async {
    final prefs = await SharedPreferences.getInstance();
    lang = prefs.getString('lang') ?? "ar";
    notifyListeners();
  }

  Future<void> changeLang(BuildContext context, String value) async {
    lang = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', lang);

    await context.setLocale(Locale(lang)); // 👈 دي أهم سطر

    notifyListeners();
  }
}