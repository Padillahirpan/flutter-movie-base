import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color backgroundColor = Color(0xFF1F1D2B);
const Color ghostWhite = Color(0xFFB8B8D4);
const Color saffron = Color(0xFF00BFA6);

const Color primaryColor = Color(0xFFFFFAFF);
const Color secondaryColor = Color(0xFFD8C682);
const Color tertiaryColor = Color(0xFFF8FFDF);
const Color errorColor = Color(0xFFBA1A1A);

const Color onSurfaceColor = Color(0xFF1E1B11);
const Color surfaceColor = Color(0xFFFFF9EE);

final ThemeData darkMovieTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: primaryColor,

  primaryColor: Color(0xFFE50914), // Netflix red accent

  colorScheme: ColorScheme.dark(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: surfaceColor,
    tertiary: tertiaryColor,
    onSurface: onSurfaceColor,
    error: errorColor,
    onSurfaceVariant: onSurfaceColor,
  ),

  textTheme: TextTheme(
    bodyLarge: GoogleFonts.poppins(color: ghostWhite),
    bodyMedium: GoogleFonts.poppins(color: ghostWhite),
    bodySmall: GoogleFonts.poppins(color: ghostWhite),
    labelLarge: GoogleFonts.poppins(color: ghostWhite),
  ),

  // appBarTheme: AppBarTheme(
  //   backgroundColor: Color(0xFF1E1E1E),
  //   titleTextStyle: TextStyle(
  //     color: Color(0xFFE0E0E0),
  //     fontSize: 20,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   iconTheme: IconThemeData(color: Color(0xFFE0E0E0)),
  // ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     // primary: Color(0xFFE50914),
  //     // onPrimary: Colors.white,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //   ),
  // ),
);
