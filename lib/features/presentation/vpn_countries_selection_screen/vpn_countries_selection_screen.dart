import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/vpn_countries_selection_controller.dart';
import 'models/country_item_model.dart';
import 'widgets/country_item_widget.dart';

class VpnCountriesSelectionScreen
    extends GetWidget<VpnCountriesSelectionController> {
  VpnCountriesSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorFFF0F5,
      body: Column(
        children: [
          _buildHeaderSection(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
                child: Column(
                  children: [
                    _buildConnectionStatus(),
                    SizedBox(height: 40.h),
                    _buildCurrentConnectionCard(),
                    SizedBox(height: 16.h),
                    _buildSpeedStats(),
                    SizedBox(height: 24.h),
                    _buildFreeLocationsHeader(),
                    _buildCountriesList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      height: 220.h,
      decoration: BoxDecoration(
        color: appTheme.colorFF185B,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36.h),
          bottomRight: Radius.circular(36.h),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 24.h,
            left: 0,
            child: CustomImageView(
              imagePath: ImageConstant.imgFrame,
              width: 228.h,
              height: 165.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CustomImageView(
              imagePath: ImageConstant.imgFrameWhiteA700,
              width: 158.h,
              height: 190.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40.h,
            left: 32.h,
            right: 32.h,
            child: Column(
              children: [
                SizedBox(height: 12.h),
                _buildAppBar(),
                SizedBox(height: 38.h),
                _buildSearchBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          iconPath: ImageConstant.imgCategory2,
          backgroundColor: appTheme.colorFF3B74,
          size: 40.h,
          iconSize: 24.h,
          onTap: () => controller.onMenuTap(),
        ),
        Text(
          'Countries',
          style: TextStyleHelper.instance.title16SemiBold,
        ),
        CustomIconButton(
          iconPath: ImageConstant.imgCrown,
          backgroundColor: appTheme.colorFF3B74,
          size: 40.h,
          iconSize: 24.h,
          onTap: () => controller.onPremiumTap(),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        borderRadius: BorderRadius.circular(16.h),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.searchController,
              onChanged: (value) => controller.onSearchChanged(value),
              decoration: InputDecoration(
                hintText: 'Search for country or city',
                hintStyle: TextStyleHelper.instance.body14,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                  vertical: 16.h,
                ),
              ),
              style: TextStyleHelper.instance.body14,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgSearchnormal,
              height: 24.h,
              width: 24.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectionStatus() {
    return Column(
      children: [
        Text(
          'Connecting Time',
          style: TextStyleHelper.instance.body12,
        ),
        SizedBox(height: 8.h),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.vpnCountriesSelectionModel.value.hours?.value ??
                      '02',
                  style: TextStyleHelper.instance.headline24Bold,
                ),
                Text(
                  ':',
                  style: TextStyleHelper.instance.headline24Bold,
                ),
                Text(
                  controller.vpnCountriesSelectionModel.value.minutes?.value ??
                      '41',
                  style: TextStyleHelper.instance.headline24Bold,
                ),
                Text(
                  ':',
                  style: TextStyleHelper.instance.headline24Bold,
                ),
                Text(
                  controller.vpnCountriesSelectionModel.value.seconds?.value ??
                      '52',
                  style: TextStyleHelper.instance.headline24Bold,
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildCurrentConnectionCard() {
    return Obx(() => Container(
          padding: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
            color: appTheme.colorFFF9F9,
            borderRadius: BorderRadius.circular(16.h),
            boxShadow: [
              BoxShadow(
                color: appTheme.blackCustom.withAlpha(13),
                blurRadius: 4.h,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomImageView(
                    imagePath: controller.vpnCountriesSelectionModel.value
                            .currentFlag?.value ??
                        ImageConstant.imgNlNetherlands,
                    width: 42.h,
                    height: 32.h,
                  ),
                  SizedBox(width: 12.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.vpnCountriesSelectionModel.value
                                .currentCountry?.value ??
                            'Netherlands',
                        style: TextStyleHelper.instance.body14Medium,
                      ),
                      Text(
                        controller.vpnCountriesSelectionModel.value.currentCity
                                ?.value ??
                            'Amsterdam',
                        style: TextStyleHelper.instance.body12,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    controller.vpnCountriesSelectionModel.value.connectionType
                            ?.value ??
                        'Stealth',
                    style: TextStyleHelper.instance.body12,
                  ),
                  Text(
                    '${controller.vpnCountriesSelectionModel.value.connectionPercentage?.value ?? '14'}%',
                    style: TextStyleHelper.instance.body12Medium
                        .copyWith(color: appTheme.colorFF0008),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildSpeedStats() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: appTheme.colorFFF9F9,
              borderRadius: BorderRadius.circular(16.h),
              boxShadow: [
                BoxShadow(
                  color: appTheme.blackCustom.withAlpha(13),
                  blurRadius: 4.h,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 28.h,
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: appTheme.colorFF00D5,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: Center(
                    child: CustomImageView(
                      imagePath: ImageConstant.imgFlag,
                      height: 16.h,
                      width: 16.h,
                    ),
                  ),
                ),
                SizedBox(width: 12.h),
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Download :',
                          style: TextStyleHelper.instance.body12,
                        ),
                        Text(
                          controller.vpnCountriesSelectionModel.value
                                  .downloadSpeed?.value ??
                              '527 MB',
                          style: TextStyleHelper.instance.body14Medium,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
        SizedBox(width: 19.h),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: appTheme.colorFFF9F9,
              borderRadius: BorderRadius.circular(16.h),
              boxShadow: [
                BoxShadow(
                  color: appTheme.blackCustom.withAlpha(13),
                  blurRadius: 4.h,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 28.h,
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: appTheme.colorFFF5F5, // Red color for upload
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: Center(
                    child: CustomImageView(
                      imagePath: ImageConstant.imgFlagRed600,
                      height: 16.h,
                      width: 16.h,
                    ),
                  ),
                ),
                SizedBox(width: 12.h),
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upload :',
                          style: TextStyleHelper.instance.body12,
                        ),
                        Text(
                          controller.vpnCountriesSelectionModel.value
                                  .uploadSpeed?.value ??
                              '49 MB',
                          style: TextStyleHelper.instance.body14Medium,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFreeLocationsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => Text(
              'Free Locations (${controller.countryItemsList.length})',
              style: TextStyleHelper.instance.body12Medium
                  .copyWith(color: appTheme.colorFF0008),
            )),
        CustomImageView(
          imagePath: ImageConstant.imgInfocircle,
          height: 16.h,
          width: 16.h,
        ),
      ],
    );
  }

  Widget _buildCountriesList() {
    return Obx(() => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.countryItemsList.length,
          separatorBuilder: (context, index) => SizedBox(height: 8.h),
          itemBuilder: (context, index) {
            CountryItemModel model = controller.countryItemsList[index];
            return CountryItemWidget(
              countryItemModel: model,
              onTimerTap: () => controller.onTimerTap(model),
              onConnectTap: () => controller.onConnectTap(model),
            );
          },
        ));
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48.h, vertical: 12.h),
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        border: Border(
          top: BorderSide(
            color: appTheme.colorFFF5F5,
            width: 1.h,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              ImageConstant.imgRectangle186,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBottomNavItem(
                icon: ImageConstant.imgMap,
                label: 'Countries',
                isActive: true,
                onTap: () => controller.onCountriesNavTap(),
              ),
              _buildBottomNavItem(
                icon: ImageConstant.imgRadar,
                label: 'Disconnect',
                isActive: false,
                onTap: () => controller.onDisconnectNavTap(),
              ),
              _buildBottomNavItem(
                icon: ImageConstant.imgSetting,
                label: 'Setting',
                isActive: false,
                onTap: () => controller.onSettingsNavTap(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem({
    required String icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: icon,
            height: 24.h,
            width: 24.h,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyleHelper.instance.body12Medium.copyWith(
                color: isActive ? Color(0xFF185BFF) : appTheme.colorFF0008),
          ),
        ],
      ),
    );
  }
}
