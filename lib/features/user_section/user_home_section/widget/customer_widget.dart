
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomerWidget extends StatelessWidget {

  final Widget craditIcon;
  final String title;
  final String subtitle;

  const CustomerWidget({
    super.key,
    required this.craditIcon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.cFFEDE6,
              borderRadius: BorderRadius.circular(80.r),
            ),
            padding: EdgeInsets.all(8.w),
            child: craditIcon,
          ),
          UIHelper.horizontalSpace(16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextFontStyle.titleStyle14w400c5E5E5EManrope,
              ),
              UIHelper.verticalSpace(4.h),
              Text(
                subtitle,
                style: TextFontStyle.titleStyle16w500c181818Manrope,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
