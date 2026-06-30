import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: const Color(0xff0B0D10),

    colorScheme: ColorScheme.dark(
      primary: const Color(0xffD32F2F),
      secondary: const Color(0xff4A6FA5),
      surface: const Color(0xff171B22),
    ),

    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
  );
}
