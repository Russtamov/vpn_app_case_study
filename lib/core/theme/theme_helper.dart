import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = "lightCode";

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get black => Color(0xFF1E1E1E);
  Color get white => Color(0xFFFFFFFF);
  Color get gray400 => Color(0xFF9CA3AF);
  Color get gray100 => Color(0xFFF3F4F6);

  // Additional Colors
  Color get whiteCustom => Colors.white;
  Color get blackCustom => Colors.black;
  Color get transparentCustom => Colors.transparent;
  Color get greyCustom => Colors.grey;
  Color get colorFF185B => Color(0xFF185BFF);
  Color get colorFF0008 => Color(0xFF00081E);
  Color get colorFFF0F5 => Color(0xFFF0F5F5);
  Color get colorFF3B74 => Color(0xFF3B74FF);
  Color get colorFFF9F9 => Color(0xFFF9F9F9);
  Color get colorFF00D5 => Color.fromARGB(255, 192, 227, 215);
  Color get colorFFE639 => Color(0xFFE63946);
  Color get colorFFF5F5 => Color.fromARGB(255, 230, 213, 213);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
