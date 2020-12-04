import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigor/controllers/locale_controller.dart';
import 'package:vigor/controllers/theme_controller.dart';
import 'package:vigor/models/data/menu_option.dart';

/// this was taken directly from John's repo: https://github.com/FireJuun/prapare
/// specifically, https://github.com/FireJuun/prapare/blob/main/lib/ui/views/settings/settings_controller.dart
///
class SettingsController extends GetxController {
  static SettingsController get to => Get.find();

  /// PROPERTIES
  final ThemeController _themeController =
      Get.put<ThemeController>(ThemeController());
  final LocaleController _localeController =
      Get.put<LocaleController>(LocaleController());

  /// GETTER Functions
  List<MenuOption> getlanguageOptions() => _localeController.languageOptions;
  String get language => _localeController.currentLanguage;
  ThemeMode get themeMode => _themeController.themeMode;
  ThemeData get theme => _themeController.lightTheme;
  ThemeData get darkTheme => _themeController.darkTheme;

  /// SETTER Functions
  Future setThemeMode(ThemeMode obj) async =>
      await _themeController.setThemeMode(obj);

  Future setLocale(String obj) async =>
      await _localeController.updateLanguage(obj);
}