import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_planet/resources/mp_colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getMPTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: MPColors.primaryBackground,

// App Bar theme

    appBarTheme: AppBarTheme(
      backgroundColor: MPColors.primaryBackground,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle:
          _customTextStyle(fontSize: 20, color: MPColors.secondaryText),
    ),
    // text theme
    textTheme: TextTheme(
      titleMedium: _customTextStyle(
        fontSize: 20,
        color: MPColors.secondaryText,
      ),
      titleSmall: _customTextStyle(
        fontSize: 18,
        color: MPColors.secondaryText,
      ),
      bodyLarge: _customTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: MPColors.primaryText,
      ),
      bodyMedium: _customTextStyle(
        fontSize: 14,
        color: MPColors.secondaryText,
      ),
      bodySmall: _customTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: MPColors.primaryText,
      ),
    ),
  );
}

TextStyle _customTextStyle(
    {required double fontSize,
    FontWeight fontWeight = FontWeight.w500,
    required Color color}) {
  return GoogleFonts.poppins(
      fontSize: fontSize, fontWeight: fontWeight, color: color);
}
