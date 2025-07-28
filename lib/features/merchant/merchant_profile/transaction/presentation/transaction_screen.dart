
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:digital_app/common_widgets/appbar_widget.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(text: 'Transaction log'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [




            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.cFFE4D9, width: 1.w),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(AppImages.saraProfile, height: 50.h),
                                UIHelper.horizontalSpace(16.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sara Akter',
                                      style: TextFontStyle.titleStyle14w600c000000Manrope,
                                    ),
                                    UIHelper.verticalSpace(4.h),
                                    Text(
                                      'saraakter@gmailcom',
                                      style: TextFontStyle.titleStyle14w500c757575Manrope,
                                    ),
                                    UIHelper.verticalSpace(4.h),
                                    Text(
                                      'SUST-#236555',
                                      style: TextFontStyle
                                          .titleStyle12w500cFF4800Manrope
                                          .copyWith(fontSize: 14.sp),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            UIHelper.verticalSpace(12.h),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Fashion Hub ',
                                      style: TextFontStyle.titleStyle16w600c181818Manrope,
                                    ),
                                    Text(
                                      '25% off ',
                                      style: TextFontStyle.titleStyle14w600cFF4800Manrope,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    image: DecorationImage(
                                      image: AssetImage(AppImages.firstfood),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(AppIcons.check),
                                UIHelper.horizontalSpace(8.w),
                                Text(
                                  '4 June 2025, 2:30 PM',
                                  style: TextFontStyle.titleStyle14w400c757575Manrope,
                                )
                              ],
                            ),
                            UIHelper.verticalSpace(16.h),
                            Row(
                              children: [
                                SvgPicture.asset(AppIcons.mapIcon),
                                UIHelper.horizontalSpace(8.w),
                                Text(
                                  '4 June 2025, 2:30 PM',
                                  style: TextFontStyle.titleStyle14w400c757575Manrope,
                                )
                              ],
                            ),
                            UIHelper.verticalSpace(16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Saved \$150',
                                  style: TextFontStyle
                                      .titleStyle14w600cFF4800Manrope
                                      .copyWith(fontSize: 18.sp),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                                  decoration: ShapeDecoration(
                                    color: AppColors.cEBF6EE,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.r),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Redeemed',
                                      style: TextFontStyle
                                          .titleStyle14w600c000000Manrope
                                          .copyWith(fontSize: 12.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                );
              },
            )



          ],
        ),
      ),
    );
  }
}
