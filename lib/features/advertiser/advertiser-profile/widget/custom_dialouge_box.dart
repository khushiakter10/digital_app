
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void showDeleteAccountDialog(BuildContext context, VoidCallback callback,String title,String subTitle,String buttonTitle) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextFontStyle.titleStyle20w600c182245Manrope.copyWith(
                          color: AppColors.c000000,
                          fontSize: 24
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    textAlign: TextAlign.center,
                    subTitle,
                    style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.grey888E9C),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.w,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(

                      backgroundColor: AppColors.cFFFFFF,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColors.primary2,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      shadowColor: Colors.transparent

                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextFontStyle.titleStyle14w600c15803DManrope.copyWith(color: AppColors.primary2,fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                SizedBox(
                  width: 120.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      shadowColor: Colors.transparent,
                    ),

                    onPressed: () {
                      Navigator.pop(context);
                      callback();
                    },
                    child: Text(
                      buttonTitle,
                      style: TextFontStyle.titleStyle14w600c15803DManrope.copyWith(color: AppColors.white,fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}




