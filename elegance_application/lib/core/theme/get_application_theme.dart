
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Color(0xFFF9F6F2), // Soft Ivory for a clean, premium look
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // Gold for luxury
        foregroundColor: Colors.white, // White text for contrast
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Color(0xFF1C1C1C), // Deep black for text readability
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF9F6F2), // Soft Ivory
      foregroundColor: Color(0xFF1C1C1C), // Deep black text/icons
      elevation: 0, // Flat, modern look
    ),
    cardColor: Color(0xFFEFE5DA), // Light beige for card elements
  );
}

