import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: Colors.pink,
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    fontFamily: 'Montserrat',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    // inputDecorationTheme: const InputDecorationTheme(
    //   border: OutlineInputBorder(),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: Colors.pinkAccent),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: Colors.grey),
    //   ),
    //   hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
    //   labelStyle: TextStyle(fontSize: 16, color: Colors.black),
    // ),
  );
}
