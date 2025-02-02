import 'package:flutter/material.dart';

class MyTheme {
  static const Color romadyIconColor = Color(0xFFE5D7D7);
  //static const Color whiteIcon = Colors.white;
  static const Color KohliIconColor = Color(0xFF1A2A4D);
  static const Color romady = Color(0xFFE0E0E0);
  static const Color kohli = Color(0xFF1A2A4D);
  static const Color pinkColor = Color(0xFFEEA1B3); // Shared color in both themes
  static const buttonText = TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold);
  static const pinkText = TextStyle(color: Color(0xFFEEA1B3), fontSize: 16);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xFF1A2A4D),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1A2A4D),
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: Color(0xFF1A2A4D),
        size: 34,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFE5D7D7),
        size: 20,
      ),
    ),
    textTheme: const TextTheme(
      //appbar
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      //bold words,blackl,20
      bodyLarge: TextStyle(
        color: Color(0xFF1A2A4D),
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
//kohli.16
      bodyMedium: TextStyle(
        color: Color(0xFF1A2A4D),
        fontSize: 14,
      ),
      //grey,20
      titleMedium: TextStyle(
        color: Color(0xFFE5D7D7),
        fontSize: 15,
      ),
//black,14
      bodySmall: TextStyle(color:Colors.black, fontSize: 12),
      titleSmall: TextStyle(
          color:  Color(0xFF1A2A4D),fontSize: 14,fontWeight: FontWeight.bold
      ),

    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: Color(0xFF1A2A4D), // Background for light theme
          foregroundColor: Colors.white, // Text color for light theme
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.all(10),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
      primaryColor: Color(0xFFE5D7D7),
      scaffoldBackgroundColor: Color(0xFF1A2A4D),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF1A2A4D),
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF1A2A4D),
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          color: Color(0xFFEEA1B3),
          size: 34,
        ),
        unselectedIconTheme: IconThemeData(
          color: Color(0xFFE5D7D7),
          size: 20,
        ),
      ),
      textTheme: const TextTheme(
          //appbar
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          //bold ,grey,20
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          //kohli,16
          bodyMedium: TextStyle(
            color:Colors.white,
            fontSize: 14,
          ),
          //kohli,20
          titleMedium: TextStyle(
            color:Colors.white,
            fontSize: 15,
          ),
          titleSmall: TextStyle(
            color:  Colors.white,fontSize: 14,fontWeight: FontWeight.bold
          ),

          bodySmall: TextStyle(color:Colors.white, fontSize: 12),),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white, // Background for light theme
              backgroundColor: Color(0xFF1A2A4D), // Text color for light theme
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(10),
              textStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold))));
}
