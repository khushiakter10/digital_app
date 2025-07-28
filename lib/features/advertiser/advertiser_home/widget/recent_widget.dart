
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertiserRecentWidget extends StatelessWidget {
  final Widget qrIcon;
  final String title;
  final String subtitle;
  final bool showDivider;

  const AdvertiserRecentWidget({
    super.key,
    required this.qrIcon,
    required this.title,
    required this.subtitle,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            children: [
              qrIcon,
              UIHelper.horizontalSpace(8.w),

              Expanded(child: Text( title,     style: TextFontStyle.titleStyle14w600c212B36Manrope)),

              UIHelper.horizontalSpace(8.w),
              Text(  subtitle,  style: TextFontStyle.titleStyle14w400c797979Manrope),
              UIHelper.verticalSpace(30.h)
            ],
          ),
        ),

        if (showDivider)
          Divider( color: AppColors.cE8E8E8,height: 1.h),



      ],
    );
  }
}
