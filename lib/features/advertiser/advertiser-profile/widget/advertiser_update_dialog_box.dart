
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


void AdvertiserUpdateDialogBox(BuildContext context, VoidCallback callback,String title,String subTitle,String buttonTitle) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => Dialog(
      backgroundColor: AppColors.cFFFFFF,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppIcons.rightClickIcon,
                    width: 110.w,
                    height: 98.h,
                  ),
                  UIHelper.verticalSpace(32.h),

                  Text(
                    'Update Success!',
                    style: TextFontStyle.titleStyle24w600primary2Manrope.copyWith(
                      color: AppColors.c2F2F2F,
                    ),
                  ),
                  UIHelper.verticalSpace(8.h),
                  Text(
                    'Your password has been updated \nsuccessfully. ',
                    textAlign: TextAlign.center,
                    style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                      color: AppColors.c2F2F2F,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  UIHelper.verticalSpace(32.h),
                  CustomButton(
                    name: "Continue",
                    onCallBack: () {
                      Navigator.pop(context);

                    },
                    context: context,
                    color: AppColors.primary2,
                    height: 39.h,
                    borderRadius: 46.r,
                    textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}