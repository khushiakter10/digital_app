import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomHelpCenterButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String? iconPath;

  const CustomHelpCenterButton({
    super.key,
    required this.text,
    this.onTap,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.cF5F6F7,
          elevation: 3,
          shadowColor: Colors.black12,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          children: [
            if (iconPath != null)
              SvgPicture.asset(
                iconPath!,
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary2,
                  BlendMode.srcIn,
                ),
              ),
            if (iconPath != null) UIHelper.horizontalSpace(12.w),
            Expanded(
              child: Text(text,style: TextFontStyle.titleStyle18w600c454545Manrope),



            ),
          ],
        ),
      ),
    );
  }
}
