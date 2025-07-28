
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertiseCustomAddOffer extends StatelessWidget {
  final Widget scanIcon;
  final String text;
  final VoidCallback onTap;

  const AdvertiseCustomAddOffer({
    super.key, required this.scanIcon, required this.text, required this.onTap,


  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,

                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0AFF4800),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(500.r),
                ),
                child: scanIcon),
          ),
          UIHelper.verticalSpace(12.h),
          Text(text, style: TextFontStyle.titleStyle14w500c2F2F2FManrope),



        ],
      ),
    );
  }
}
