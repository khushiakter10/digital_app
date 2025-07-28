
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdvertiserRedemptionsTodayWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const AdvertiserRedemptionsTodayWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon, height: 22.h),
            SizedBox(height: 8),
            Text(title, style: TextFontStyle.titleStyle20w700c181818Manrope
            ),
           UIHelper.verticalSpace(4.h),
            Text(subtitle, style: TextFontStyle.titleStyle14w400c757575Manrope,),
          ],
        ),
      ),
    );
  }
}
