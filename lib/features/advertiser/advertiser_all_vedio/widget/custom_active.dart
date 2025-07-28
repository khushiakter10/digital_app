
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomActiveWidget extends StatelessWidget {
  final BorderRadius borderRadius;
  final String label;
  final bool isSelected;
  final bool isDisabled;

  const CustomActiveWidget({
    required this.borderRadius,
    required this.label,
    required this.isSelected,
    required this.isDisabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: isSelected ? AppColors.primary2 : AppColors.cFFFFFF,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 16.w),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: isSelected
              ? TextFontStyle.titleStyle14w500cFFFFFFManrope
              : TextFontStyle.titleStyle14w500c757575Manrope,
        ),
      ),
    );
  }
}
