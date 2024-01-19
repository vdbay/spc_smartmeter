import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SPCThemeData {
  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2A3E61), brightness: Brightness.light),
        useMaterial3: true,
        fontFamily: GoogleFonts.rubik().fontFamily,
      );
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2A3E61), brightness: Brightness.dark),
        fontFamily: GoogleFonts.rubik().fontFamily,
      );
}
