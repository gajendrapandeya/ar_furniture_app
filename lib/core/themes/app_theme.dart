import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  /// Light Theme
  static final ThemeData lightThemeData = ThemeData(
    primaryColor: LightColor.primaryColor,
    iconTheme: const IconThemeData(color: LightColor.primaryColor),
    useMaterial3: true,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: LightColor.primaryColor,
      selectedItemColor: LightColor.accentColor,
      unselectedItemColor: LightColor.secondaryColor,
      elevation: 0,
      selectedLabelStyle: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: LightColor.primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: LightColor.secondaryColor,
      ),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightColor.primaryColor,
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        color: LightColor.secondaryColor,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        color: LightColor.secondaryColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: LightColor.secondaryColor,
      brightness: Brightness.light,
      tertiary: LightColor.accentColor,
      primary: LightColor.platianGreen,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: LightColor.primaryColor,
        backgroundColor: LightColor.platianGreen,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        minimumSize: Size.zero,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: LightColor.platianGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: LightColor.secondaryColor,
            width: 2,
          ),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: LightColor.primaryColor,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: LightColor.platianGreen,
        textStyle: const TextStyle(
          fontSize: 14,
          color: LightColor.primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        minimumSize: Size.zero,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
      thickness: 1,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: LightColor.secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade50,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      suffixIconColor: LightColor.secondaryColor,
      labelStyle: const TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      hintStyle: const TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: LightColor.secondaryColor),
  );

  /// Dark theme
  static final ThemeData darkThemeData = ThemeData(
    primaryColor: DarkColor.primaryColor,
    iconTheme: const IconThemeData(color: DarkColor.secondaryColor),
    useMaterial3: true,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: DarkColor.primaryColor,
      selectedItemColor: DarkColor.primaryColor,
      unselectedItemColor: DarkColor.secondaryColor,
      elevation: 0,
      selectedLabelStyle: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: DarkColor.primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: DarkColor.primaryColor,
      ),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkColor.primaryColor,
    cardColor: DarkColor.secondaryColor,
    unselectedWidgetColor: DarkColor.secondaryColor,
    fontFamily: 'Poppins',
    splashColor: DarkColor.secondaryColor,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        color: DarkColor.secondaryColor,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        color: DarkColor.secondaryColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: DarkColor.secondaryColor,
      brightness: Brightness.dark,
      tertiary: LightColor.accentColor,
      onSecondary: LightColor.secondaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: DarkColor.secondaryColor,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: DarkColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: LightColor.secondaryColor,
        foregroundColor: LightColor.primaryColor,
        textStyle: const TextStyle(
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        minimumSize: Size.zero,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: DarkColor.secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red.withOpacity(
            0.1,
          ),
        ),
      ),
      suffixIconColor: LightColor.secondaryColor,
      labelStyle: const TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: const TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      errorStyle: TextStyle(
        color: Colors.red.withOpacity(0.1),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: DarkColor.primaryColor),
  );
}
