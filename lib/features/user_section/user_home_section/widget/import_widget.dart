
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImportWidget extends StatelessWidget {
  const ImportWidget({
    super.key,
    required this.imporTantNotesText,
  });

  final List<String> imporTantNotesText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.cF9FAFB,
          borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppIcons.alertIcon, height: 18.h),
                UIHelper.horizontalSpace(8.w),
                Text(
                  'Important Notes',
                  style: TextFontStyle.titleStyle16w600c181818Manrope,
                )
              ],
            ),
            UIHelper.verticalSpace(8.h),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: imporTantNotesText.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 4.w,
                        height: 4.h,
                        margin: EdgeInsets.only(top: 6.h),
                        decoration: ShapeDecoration(
                          color: AppColors.cFF4800,
                          shape: OvalBorder(),
                        ),
                      ),
                      UIHelper.horizontalSpace(11.w),
                      Expanded(
                        child: Text(
                          imporTantNotesText[index],
                          style: TextFontStyle
                              .titleStyle14w400c5E5E5EManrope,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}