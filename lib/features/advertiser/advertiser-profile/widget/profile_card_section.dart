
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCardSection extends StatelessWidget {
  const ProfileCardSection({
    super.key,
    required this.icon,
    required this.text,
    required this.callback,
  });
  final String icon;
  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric( vertical: 8.h),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.cFFEDE6,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: SvgPicture.asset(icon),
                ),
              ),
              UIHelper.horizontalSpace(16.w),
              Text(
                text,
                style: TextFontStyle.titleStyle18w600c000000Manrope
                    .copyWith(color: AppColors.c000000,fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SvgPicture.asset(
            AppIcons.arrowWriteIcon,
            height: 40,
            width: 40,
          ),
        ],
      ),
    );
  }
}