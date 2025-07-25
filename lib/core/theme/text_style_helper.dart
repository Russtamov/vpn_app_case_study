import 'package:flutter/material.dart';
import '../app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline24Bold => TextStyle(
        fontSize: 24.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.colorFF0008,
      );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title16SemiBold => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
        color: appTheme.whiteCustom,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body14 => TextStyle(
        fontSize: 14.fSize,
        color: appTheme.colorFF0008,
      );

  TextStyle get body14Medium => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
        color: appTheme.colorFF0008,
      );

  TextStyle get body12 => TextStyle(
        fontSize: 12.fSize,
        color: appTheme.colorFF0008,
      );

  TextStyle get body12Medium => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );
}
