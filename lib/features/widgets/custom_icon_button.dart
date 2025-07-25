import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import 'custom_image_view.dart';

/**
 * CustomIconButton - A reusable icon button component with customizable appearance
 * 
 * Features:
 * - Configurable background color and icon
 * - Responsive sizing using SizeUtils
 * - Accessibility support with custom labels
 * - Tap handling with visual feedback
 * - Consistent styling across the application
 * 
 * @param iconPath - Path to the icon asset (SVG/PNG)
 * @param onTap - Callback function when button is tapped
 * @param backgroundColor - Background color of the button
 * @param size - Overall size of the button (width and height)
 * @param iconSize - Size of the icon inside the button
 * @param accessibilityLabel - Label for screen readers
 */
class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.iconPath,
    this.onTap,
    this.backgroundColor,
    this.size,
    this.iconSize,
    this.accessibilityLabel,
    this.color,
  }) : super(key: key);

  /// Path to the icon asset (SVG, PNG, )
  final String? iconPath;

  /// Callback function triggered when the button is tapped
  final VoidCallback? onTap;

  /// Background color of the button
  final Color? backgroundColor;

  /// Overall size of the button (width and height)
  final double? size;

  /// Size of the icon inside the button
  final double? iconSize;

  /// Accessibility label for screen readers
  final String? accessibilityLabel;

  /// Icon color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final buttonSize = size ?? 28.h;
    final iconDisplaySize = iconSize ?? 20.h;
    final bgColor = backgroundColor ?? Color(0xFF185BFF);

    return Semantics(
      label: accessibilityLabel ?? 'Icon button',
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.h),
        child: Container(
          width: buttonSize,
          height: buttonSize,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.h),
          ),
          child: Center(
            child: iconPath != null
                ? CustomImageView(
                    imagePath: iconPath!,
                    height: iconDisplaySize,
                    width: iconDisplaySize,
                    fit: BoxFit.contain,
                    color: color,
                  )
                : SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
