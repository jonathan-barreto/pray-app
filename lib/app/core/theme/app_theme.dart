import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pray_app/app/core/consts/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        centerTitle: false,
      ),
      iconTheme: const IconThemeData(color: AppColors.iconActive),

      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onError,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        surfaceDim: AppColors.surfaceDim,
        surfaceBright: AppColors.surfaceBright,
        surfaceContainerLowest: AppColors.surfaceContainerLowest,
        surfaceContainerLow: AppColors.surfaceContainerLow,
        surfaceContainer: AppColors.surfaceContainer,
        surfaceContainerHigh: AppColors.surfaceContainerHigh,
        surfaceContainerHighest: AppColors.surfaceContainerHighest,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        shadow: AppColors.cardShadow,
        scrim: AppColors.overlay,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
        surfaceTint: AppColors.primary,
        inverseSurface: AppColors.onSurface,
        onInverseSurface: AppColors.surface,
        inversePrimary: AppColors.secondary,
      ),
      dividerColor: AppColors.divider,
      dividerTheme: const DividerThemeData(color: AppColors.divider),
      cardColor: AppColors.surface,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.dmSans(
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          fontSize: 102,
        ),
        displayMedium: GoogleFonts.dmSans(
          fontWeight: FontWeight.w300,
          letterSpacing: -0.25,
          fontSize: 64,
        ),
        displaySmall: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          fontSize: 51,
        ),
        headlineMedium: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          fontSize: 36,
        ),
        headlineSmall: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          fontSize: 25,
        ),
        titleLarge: GoogleFonts.dmSans(
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
          letterSpacing: 0.1,
          fontSize: 20,
        ),
        titleMedium: GoogleFonts.dmSans(
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
          letterSpacing: 0.1,
          fontSize: 18,
        ),
        titleSmall: GoogleFonts.dmSans(
          fontWeight: FontWeight.w500,
          letterSpacing: 0.05,
          fontSize: 16,
        ),
        bodyLarge: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          color: AppColors.onSurface,
          letterSpacing: 0.15,
          fontSize: 16,
        ),
        bodyMedium: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          color: AppColors.onSurface,
          letterSpacing: 0.1,
          fontSize: 14,
        ),
        bodySmall: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          color: AppColors.textMuted,
          letterSpacing: 0.1,
          fontSize: 12,
        ),
        labelLarge: GoogleFonts.dmSans(
          fontWeight: FontWeight.w500,
          color: AppColors.onSurface,
          letterSpacing: 0.5,
          fontSize: 14,
        ),
        labelSmall: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          color: AppColors.textMuted,
          letterSpacing: 0.5,
          fontSize: 10,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.iconInactive,
        backgroundColor: AppColors.surface,
        selectedLabelStyle: GoogleFonts.dmSans(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
          fontSize: 12,
        ),
        unselectedLabelStyle: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
          fontSize: 12,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
          foregroundColor: const WidgetStatePropertyAll(AppColors.onPrimary),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    const darkBackground = Color(0xFF2B2D30);
    const darkSurface = Color(0xFF35383C);
    const darkSurfaceVariant = Color(0xFF3E4145);
    const darkOnSurface = Color(0xFFE8E6E3);
    const darkOnSurfaceVariant = Color(0xFFC4C2BF);
    const darkOutline = Color(0xFF5A5D61);
    const darkPrimary = AppColors.primary;
    const darkOnPrimary = Color(0xFF1A1C1E);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: darkPrimary,
      scaffoldBackgroundColor: darkBackground,
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: darkSurface,
        foregroundColor: darkOnSurface,
        centerTitle: false,
        elevation: 0,
      ),
      iconTheme: const IconThemeData(color: darkPrimary),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: darkPrimary,
        onPrimary: darkOnPrimary,
        primaryContainer: Color(0xFF4A5248),
        onPrimaryContainer: Color(0xFFCAD9C7),
        secondary: Color(0xFF8FA090),
        onSecondary: Color(0xFF2B2D30),
        secondaryContainer: Color(0xFF4A5248),
        onSecondaryContainer: Color(0xFFD7E3D3),
        tertiary: Color(0xFFD8CCB5),
        onTertiary: Color(0xFF2B2D30),
        tertiaryContainer: Color(0xFF5A5248),
        onTertiaryContainer: Color(0xFFF2E8D4),
        error: Color(0xFFD88A8A),
        onError: Color(0xFF2B2D30),
        errorContainer: Color(0xFF6B4040),
        onErrorContainer: Color(0xFFF5E0E0),
        surface: darkSurface,
        onSurface: darkOnSurface,
        surfaceDim: Color(0xFF252729),
        surfaceBright: Color(0xFF484B4F),
        surfaceContainerLowest: Color(0xFF1F2123),
        surfaceContainerLow: Color(0xFF2B2D30),
        surfaceContainer: darkSurface,
        surfaceContainerHigh: darkSurfaceVariant,
        surfaceContainerHighest: Color(0xFF464A4E),
        onSurfaceVariant: darkOnSurfaceVariant,
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
        outline: darkOutline,
        outlineVariant: Color(0xFF484B4F),
        surfaceTint: darkPrimary,
        inverseSurface: Color(0xFFE8E6E3),
        onInverseSurface: Color(0xFF2B2D30),
        inversePrimary: Color(0xFF6B7A68),
      ),
      dividerColor: darkOutline,
      dividerTheme: const DividerThemeData(color: darkOutline),
      cardColor: darkSurface,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.dmSans(
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          fontSize: 102,
          color: darkOnSurface,
        ),
        displayMedium: GoogleFonts.dmSans(
          fontWeight: FontWeight.w300,
          letterSpacing: -0.25,
          fontSize: 64,
          color: darkOnSurface,
        ),
        displaySmall: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          fontSize: 51,
          color: darkOnSurface,
        ),
        headlineMedium: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          fontSize: 36,
          color: darkOnSurface,
        ),
        headlineSmall: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          fontSize: 25,
          color: darkOnSurface,
        ),
        titleLarge: GoogleFonts.dmSans(
          fontWeight: FontWeight.w700,
          color: darkOnSurface,
          letterSpacing: 0.1,
          fontSize: 20,
        ),
        titleMedium: GoogleFonts.dmSans(
          fontWeight: FontWeight.w600,
          color: darkOnSurfaceVariant,
          letterSpacing: 0.1,
          fontSize: 18,
        ),
        titleSmall: GoogleFonts.dmSans(
          fontWeight: FontWeight.w500,
          letterSpacing: 0.05,
          fontSize: 16,
          color: darkOnSurface,
        ),
        bodyLarge: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          color: darkOnSurface,
          letterSpacing: 0.15,
          fontSize: 16,
        ),
        bodyMedium: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          color: darkOnSurface,
          letterSpacing: 0.1,
          fontSize: 14,
        ),
        bodySmall: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          color: darkOnSurfaceVariant,
          letterSpacing: 0.1,
          fontSize: 12,
        ),
        labelLarge: GoogleFonts.dmSans(
          fontWeight: FontWeight.w500,
          color: darkOnSurface,
          letterSpacing: 0.5,
          fontSize: 14,
        ),
        labelSmall: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          color: darkOnSurfaceVariant,
          letterSpacing: 0.5,
          fontSize: 10,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: darkPrimary,
        unselectedItemColor: darkOnSurfaceVariant,
        backgroundColor: darkSurface,
        selectedLabelStyle: GoogleFonts.dmSans(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
          fontSize: 12,
        ),
        unselectedLabelStyle: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
          fontSize: 12,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(darkPrimary),
          foregroundColor: const WidgetStatePropertyAll(darkOnPrimary),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkSurfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: darkOutline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: darkOutline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: darkPrimary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
    );
  }

  static ThemeData get theme => lightTheme;
}
