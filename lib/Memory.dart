import 'package:flutter/material.dart';
import 'contsants/AppTheme.dart';
import 'Lang.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Memory {
  static AppTheme theme = AppTheme.light;

  static Future<bool> loadPreferences() async {
    final storage = new FlutterSecureStorage();

    try {
      String lang = await storage.read(key: "lang");
      String theme = await storage.read(key: "theme");

      Lang.setLang(lang ?? 'en');
      Memory.theme = AppTheme.fromString(theme ?? 'light');
    }
    catch(e) {
      await storage.deleteAll();
      print("Storage just got fucked @ lang");
    }

    return true;
  }

  static void saveLanguage(String code) async {
    await new FlutterSecureStorage().write(key: 'lang', value: code);
  }

  static void saveTheme(bool light) async {
    await new FlutterSecureStorage().write(key: 'theme', value: light? "light" : "dark");
  }

}