import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app_export.dart';

class CountryItemModel {
  Rx<String>? flagIcon;
  Rx<String>? countryName;
  Rx<String>? locationCount;
  Rx<String>? timerIcon;
  Rx<Color>? timerBgColor;
  Rx<String>? connectIcon;
  Rx<Color>? connectBgColor;

  CountryItemModel({
    this.flagIcon,
    this.countryName,
    this.locationCount,
    this.timerIcon,
    this.timerBgColor,
    this.connectIcon,
    this.connectBgColor,
  });
}
