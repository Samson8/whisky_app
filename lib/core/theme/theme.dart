import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFD4A017);
  static const Color backgroundColor = Color(0xFF0B1519);
  static const Color plainBackgroundColor = Color(0xFF0E1C21);
  static const Color cardBackgroundColor = Color(0xFF122329);
  static const Color textColor = Colors.white;
  static const Color error = Color(0xFFFF1F0B);
  static const Color subtleTextColor = Colors.white70;
  static const Color hintTextColor = Colors.white54;
  static const Color grey = Color(0xFF899194);

  static final TextStyle headline1 = GoogleFonts.ebGaramond(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static final TextStyle headline2 = GoogleFonts.ebGaramond(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static final TextStyle headline3 = GoogleFonts.ebGaramond(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static final TextStyle bodyText1 = GoogleFonts.ebGaramond(
    fontSize: 16,
    color: textColor,
  );

  static final TextStyle bodyTextMedium = GoogleFonts.ebGaramond(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static final TextStyle bodyText2 = GoogleFonts.ebGaramond(
    fontSize: 14,
    color: subtleTextColor,
  );

  static final TextStyle buttonText = GoogleFonts.ebGaramond(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: backgroundColor, // Text color on primary button
  );

  static final TextStyle caption = GoogleFonts.ebGaramond(
    fontSize: 12,
    color: subtleTextColor,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    cardColor: cardBackgroundColor,
    hintColor: hintTextColor,
    // Set default text theme font using GoogleFonts
    textTheme:
        GoogleFonts.ebGaramondTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: headline1,
      displayMedium: headline2,
      displaySmall: headline3,
      bodyLarge: bodyText1,
      bodyMedium: bodyTextMedium,
      bodySmall: bodyText2,
      labelLarge: buttonText, // For ElevatedButton text by default
      titleMedium: GoogleFonts.ebGaramond(
          // Default for ListTile titles etc.
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500),
      titleSmall: GoogleFonts.ebGaramond(
          // Default for ListTile subtitles etc.
          color: subtleTextColor,
          fontSize: 14),
      //  caption: caption,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: textColor),
      // Apply specific style if needed, otherwise inherits from textTheme
      titleTextStyle: GoogleFonts.ebGaramond(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: backgroundColor, // Text color on button
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          iconColor: backgroundColor),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: GoogleFonts.ebGaramond(
            // Apply font to TextButton
            fontWeight: FontWeight.w500,
            fontSize: 14, // Default TextButton size
          )),
    ),

    inputDecorationTheme: InputDecorationTheme(
      // Apply font to labels and hints if needed (often inherits well)
      labelStyle: GoogleFonts.ebGaramond(color: primaryColor),
      hintStyle: GoogleFonts.ebGaramond(color: hintTextColor),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
      suffixIconColor: primaryColor,
    ),

    tabBarTheme: TabBarTheme(
      labelColor: primaryColor,
      unselectedLabelColor: subtleTextColor,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
      // Apply font to Tab labels
      labelStyle:
          GoogleFonts.ebGaramond(fontWeight: FontWeight.bold, fontSize: 14),
      unselectedLabelStyle:
          GoogleFonts.ebGaramond(fontWeight: FontWeight.normal, fontSize: 14),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: cardBackgroundColor,
      selectedItemColor: textColor,
      unselectedItemColor: grey,
      type: BottomNavigationBarType.fixed,
      // Apply font to BottomNavBar labels
      selectedLabelStyle:
          GoogleFonts.ebGaramond(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: GoogleFonts.ebGaramond(fontSize: 12),
    ),

    iconTheme: const IconThemeData(color: subtleTextColor),
  );
}
