
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class VerificationSuccessDialog extends StatelessWidget {
  final VoidCallback? onVerify;

  const VerificationSuccessDialog({super.key, this.onVerify});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
      child: Container(
        width: 327.w,
        padding:  EdgeInsets.all(24.sp),
        decoration: ShapeDecoration(
          color: AppColors.cFFFFFF,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppIcons.rightClickIcon,
              width: 110.w,
              height: 98.h,
            ),

            UIHelper.verticalSpace(32.h),
            Text('Verification Success!',style: TextFontStyle.titleStyle32w600c2F2F2FManrope.copyWith(fontSize: 24.sp),

            ),
            UIHelper.verticalSpace(8.h),

            Text(
              'Your identity has been confirmed securely and efficiently. ',
              textAlign: TextAlign.center,
              style: TextFontStyle.titleStyle14w400c757575Manrope.

              copyWith(
                fontSize: 14.sp

              ),


            ),
            UIHelper.verticalSpace(32.h),
            CustomButton(
              name: "Continue",
              onCallBack: () {
                Navigator.pop(context);
                if (onVerify != null) onVerify!();
              },
              context: context,
              color: AppColors.cFF4800,
              height: 39.h,
              borderRadius: 8.r,
              textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
            ),
          ],
        ),
      ),
    );
  }
}
