
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DiscountWidget extends StatelessWidget {
  final Widget circleIcon;
  final Widget percentIcon;

  final String title;
  final String subtitle;

  const DiscountWidget({
    super.key,
    required this.circleIcon,
    required this.percentIcon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.cD1D1D1, width: 1.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          circleIcon,
         UIHelper.horizontalSpace(8.w),
          percentIcon,
          UIHelper.horizontalSpace(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextFontStyle.titleStyle16w600c181818Manrope),
                UIHelper.verticalSpace(4.h),
                Text(subtitle,
                    style: TextFontStyle.titleStyle14w400c757575Manrope),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
