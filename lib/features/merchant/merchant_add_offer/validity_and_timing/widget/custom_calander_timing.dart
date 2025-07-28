import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCalanderTiming extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final TextEditingController controller;

  const CustomCalanderTiming({
    super.key,
    required this.label,
    required this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextFontStyle.headline12w400c5C5C5C),
          UIHelper.verticalSpace(8.h),
          GestureDetector(
            onTap: onTap,
            child: AbsorbPointer(
              child: CustomTextfield(
                contentPadding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
                borderRadius: 8.r,
                fillColor: AppColors.cFFFFFF,
                borderColor: AppColors.cE8E8E8,
                controller: controller,
                hintText: 'Select Date',
                hintTextSyle: TextFontStyle.titleStyle14w500c757575Manrope,
                prefixIcon: Transform.scale(
                  scale: 0.5,
                  child: SvgPicture.asset(AppIcons.calanderstart),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
