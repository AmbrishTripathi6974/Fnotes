import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline6: GoogleFonts.openSans(color: Colors.black.withOpacity(0.4),),
    subtitle1: GoogleFonts.openSans(
      color: Colors.black.withOpacity(0.4),
      fontSize: 16,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headline6: GoogleFonts.openSans(color: Colors.white.withOpacity(0.4), fontWeight: FontWeight.bold),
    subtitle1: GoogleFonts.openSans(
      color: Colors.white.withOpacity(0.4),
      fontSize: 16,
    ),
  );
}
