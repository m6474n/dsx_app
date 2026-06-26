import 'package:dsx_app/controller/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static const String themeKey = 'isDarkMode';
  
  final Rx<ThemeState> _themeState = Rx<ThemeState>(const LightMode());
  
  ThemeState get state => _themeState.value;
  bool get isDarkMode => _themeState.value is DarkMode;

  @override
  void onInit() {
    super.onInit();
    _loadSavedTheme();
  }

  Future<void> _loadSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(themeKey) ?? false;
    _setTheme(isDark);
  }

  Future<void> toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeKey, isDark);
    _setTheme(isDark);
  }

  void _setTheme(bool isDark) {
    if (isDark) {
      _themeState.value = const DarkMode();
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      _themeState.value = const LightMode();
      Get.changeThemeMode(ThemeMode.light);
    }
    update();
  }
}