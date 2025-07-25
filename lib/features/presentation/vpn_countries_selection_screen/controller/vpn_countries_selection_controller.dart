import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../models/country_item_model.dart';
import '../models/vpn_countries_selection_model.dart';

class VpnCountriesSelectionController extends GetxController {
  Rx<VpnCountriesSelectionModel> vpnCountriesSelectionModel =
      VpnCountriesSelectionModel().obs;
  RxList<CountryItemModel> countryItemsList = <CountryItemModel>[].obs;

  late TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    _initializeData();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void _initializeData() {
    vpnCountriesSelectionModel.value = VpnCountriesSelectionModel(
      hours: '02'.obs,
      minutes: '41'.obs,
      seconds: '52'.obs,
      currentFlag: ImageConstant.imgNlNetherlands.obs,
      currentCountry: 'Netherlands'.obs,
      currentCity: 'Amsterdam'.obs,
      connectionType: 'Stealth'.obs,
      connectionPercentage: '14'.obs,
      downloadSpeed: '527 MB'.obs,
      uploadSpeed: '49 MB'.obs,
    );

    countryItemsList.value = [
      CountryItemModel(
        flagIcon: ImageConstant.imgItItaly.obs,
        countryName: 'Italy'.obs,
        locationCount: '4 Locations'.obs,
        timerIcon: ImageConstant.imgTimer.obs,
        connectIcon: ImageConstant.imgArrowright.obs,
        connectBgColor: Color(0xFF00081E).obs,
      ),
      CountryItemModel(
        flagIcon: ImageConstant.imgNlNetherlands.obs,
        countryName: 'Netherlands'.obs,
        locationCount: '12 Locations'.obs,
        timerIcon: ImageConstant.imgTimerBlack900.obs,
        connectIcon: ImageConstant.imgArrowright.obs,
        connectBgColor: Color(0xFF00081E).obs,
      ),
      CountryItemModel(
        flagIcon: ImageConstant.imgDeGermany.obs,
        countryName: 'Germany'.obs,
        locationCount: '10 Locations'.obs,
        timerIcon: ImageConstant.imgTimerBlack900.obs,
        connectIcon: ImageConstant.imgArrowright.obs,
        connectBgColor: Color(0xFF00081E).obs,
      ),
      CountryItemModel(
        flagIcon: ImageConstant.imgDeGermany.obs,
        countryName: 'Germany'.obs,
        locationCount: '10 Locations'.obs,
        timerIcon: ImageConstant.imgTimerBlack900.obs,
        connectIcon: ImageConstant.imgArrowright.obs,
        connectBgColor: Color(0xFF00081E).obs,
      ),
    ];
  }

  void onMenuTap() {
    // Handle menu button tap
  }

  void onPremiumTap() {
    // Handle premium button tap
  }

  void onSearchChanged(String value) {
    // Handle search functionality
    if (value.isEmpty) {
      _initializeData();
    } else {
      final filteredList = countryItemsList.where((country) {
        return (country.countryName?.value ?? '')
            .toLowerCase()
            .contains(value.toLowerCase());
      }).toList();
      countryItemsList.value = filteredList;
    }
  }

  void onTimerTap(CountryItemModel model) {
    // Handle timer button tap for specific country
  }

  void onConnectTap(CountryItemModel model) {
    // Handle connect button tap for specific country
  }

  void onCountriesNavTap() {
    // Handle countries navigation tap
  }

  void onDisconnectNavTap() {
    // Handle disconnect navigation tap
  }

  void onSettingsNavTap() {
    // Handle settings navigation tap
  }
}
