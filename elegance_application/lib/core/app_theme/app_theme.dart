import 'package:flutter/material.dart';

// Primary and Secondary Colour for Branding
const Color primaryColor = Color.fromARGB(255, 32, 32, 32);
const Color secondaryColor = Color.fromARGB(255, 51, 50, 50);

class AppTheme {
  AppTheme._();

  static getApplicationTheme({required bool isDarkMode}) {
    return ThemeData(
      primaryColor: primaryColor,
      secondaryHeaderColor: secondaryColor,
      scaffoldBackgroundColor: Colors.grey[200],
      fontFamily: 'Montserrat Regular',

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Color.fromARGB(255, 255, 255, 255),
        elevation: 4,
        shadowColor: Colors.black,
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat-Regular',
          ),
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),

      // Input Decoration Theme for TextFields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: primaryColor, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey[600],
        ),
        labelStyle: const TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w400,
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: secondaryColor,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
