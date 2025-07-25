import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/country_item_model.dart';

class CountryItemWidget extends StatelessWidget {
  final CountryItemModel countryItemModel;
  final VoidCallback? onTimerTap;
  final VoidCallback? onConnectTap;

  CountryItemWidget({
    Key? key,
    required this.countryItemModel,
    this.onTimerTap,
    this.onConnectTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Row(
            children: [
              CustomImageView(
                height: 32.h,
                imagePath: countryItemModel.flagIcon?.value ?? '',
                width: 42.h,
              ),
              SizedBox(width: 12.h),
              Column(
                children: [
                  Text(
                    countryItemModel.countryName?.value ?? '',
                    style: TextStyleHelper.instance.body14Medium,
                  ),
                  Text(
                    countryItemModel.locationCount?.value ?? '',
                    style: TextStyleHelper.instance.body12.copyWith(
                      color: appTheme.gray400,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
          ),
          Row(
            children: [
              CustomIconButton(
                backgroundColor:
                    countryItemModel.timerBgColor?.value ?? appTheme.grey200,
                iconPath:
                    countryItemModel.timerIcon?.value ?? ImageConstant.imgTimer,
                iconSize: 16.h,
                onTap: onTimerTap,
                size: 28.h,
                color: appTheme.blackCustom,
              ),
              SizedBox(width: 8.h),
              CustomIconButton(
                  backgroundColor: appTheme.grey200,
                  iconPath: countryItemModel.connectIcon?.value ??
                      ImageConstant.imgArrowright,
                  iconSize: 16.h,
                  onTap: onConnectTap,
                  size: 28.h,
                  color: appTheme.blackCustom),
            ],
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.h,
            color: appTheme.blackCustom.withAlpha(25),
            offset: Offset(
              0,
              2.h,
            ),
          ),
        ],
        color: appTheme.colorFFF9F9,
      ),
      padding: EdgeInsets.all(12.h),
    );
  }
}
