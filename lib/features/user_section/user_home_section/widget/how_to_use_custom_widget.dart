
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HowToUseCustomWidget extends StatelessWidget {
  final Widget cardStoreIcon;
  final String cardtitle;
  final String cardsubtitle;

  const HowToUseCustomWidget({
    super.key,
    required this.cardStoreIcon,
    required this.cardtitle,
    required this.cardsubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.cFFF5F0,
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.cFF4800,
                  borderRadius: BorderRadius.circular(80.r),
                ),
                child: cardStoreIcon,
              ),
              UIHelper.horizontalSpace(16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardtitle,
                      style: TextFontStyle.titleStyle16w500c181818Manrope,
                    ),
                    UIHelper.verticalSpace(4.h),
                    Text(
                      cardsubtitle,
                      style: TextFontStyle.titleStyle14w400c5E5E5EManrope,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
