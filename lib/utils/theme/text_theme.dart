import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  // Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    headlineMedium: GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
    ),
    headlineSmall: GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
    ),
    titleLarge: GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    ),
    titleMedium: GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    ),
    titleSmall: GoogleFonts.lato(
      textStyle:  TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.5)),
    ),
    labelLarge: GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    ),
    labelMedium: GoogleFonts.lato(
      textStyle:  TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),
    ),
    displayLarge: GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    displayMedium: GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    ),
    displaySmall: GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.white),
    ),
  );

  // Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    headlineMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    headlineSmall: GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    titleLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    titleMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    ),
    titleSmall: GoogleFonts.poppins(
      textStyle:  TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.5)),
    ),
    labelLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    ),
    labelMedium: GoogleFonts.poppins(
      textStyle:  TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.5)),
    ),
    displayLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    displayMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    ),
    displaySmall: GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),
    ),
  );
}
