import 'package:ar_furniture_app/core/constants/storage_constants.dart';
import 'package:ar_furniture_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = StateNotifierProvider<ThemeController, ThemeData>(
  (ref) => ThemeController(),
);

/// Handles the theme of the app
/// It will be used to store the current theme
class ThemeController extends StateNotifier<ThemeData> {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeController()
      : super(
          AppTheme.lightThemeData,
        );

  ThemeMode get themeMode => _themeMode;

  // This method is responsible for getting the theme from the shared preferences
  // If the theme is light, it will set the theme to light
  // If the theme is dark, it will set the theme to dark
  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString(StorageConstants.themeKey);

    if (theme == StorageConstants.lightThemeKey) {
      _themeMode = ThemeMode.light;
      state = AppTheme.lightThemeData;
    } else {
      _themeMode = ThemeMode.dark;
      state = AppTheme.darkThemeData;
    }
  }

  // This method is responsible for toggling the theme
  void toggleTheme() async {
    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
      state = AppTheme.lightThemeData;
    } else {
      _themeMode = ThemeMode.dark;
      state = AppTheme.darkThemeData;
    }
  }
}
