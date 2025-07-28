
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      // body:
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIHelper.verticalSpace(121.h),
            Text(
              'Suki Discounts.',
              textAlign: TextAlign.center,
              style: TextFontStyle.titleStyle40w400WhiteMarcellusSc,
            ),
            Spacer(),
            SpinKitFadingCircle(
              color: AppColors.white,
              size: 80.0,
            ),
            UIHelper.verticalSpace(102.h),
          ],
        ),
      ),
    );
  }
}