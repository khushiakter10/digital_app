
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AdvertiserVerificationDialogBox extends StatelessWidget {
  final VoidCallback? onVerify;

  const AdvertiserVerificationDialogBox({super.key, this.onVerify});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
      child: Container(
        width: 327.w,
        padding: const EdgeInsets.all(24),
        decoration: ShapeDecoration(
          color: Colors.white,
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
            Text(
              'ID- CUST-8429XJ',
              style: TextFontStyle.titleStyle24w600primary2Manrope.copyWith(
                color: AppColors.primary2,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            UIHelper.verticalSpace(32.h),
            Text(
              'Verification Success!',
              style: TextFontStyle.titleStyle24w600primary2Manrope.copyWith(
                color: AppColors.c2F2F2F,
              ),
            ),
            UIHelper.verticalSpace(8.h),
            Text(
              'Your identity has been confirmed.',
              textAlign: TextAlign.center,
              style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                color: AppColors.c2F2F2F,
                fontWeight: FontWeight.w400,
              ),
            ),
            UIHelper.verticalSpace(32.h),
            CustomButton(
              name: "Verify",
              onCallBack: () {
                Navigator.pop(context);
                if (onVerify != null) onVerify!();
              },
              context: context,
              color: AppColors.primary,
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