import 'package:get/get.dart';
import '../../../../core/app_export.dart';

class VpnCountriesSelectionModel {
  Rx<String>? hours;
  Rx<String>? minutes;
  Rx<String>? seconds;
  Rx<String>? currentFlag;
  Rx<String>? currentCountry;
  Rx<String>? currentCity;
  Rx<String>? connectionType;
  Rx<String>? connectionPercentage;
  Rx<String>? downloadSpeed;
  Rx<String>? uploadSpeed;

  VpnCountriesSelectionModel({
    this.hours,
    this.minutes,
    this.seconds,
    this.currentFlag,
    this.currentCountry,
    this.currentCity,
    this.connectionType,
    this.connectionPercentage,
    this.downloadSpeed,
    this.uploadSpeed,
  });
}
