
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> redemptionHistory = [
    {
      'title': 'Fashion Hub',
      'discount': '25% off',
      'status': 'Redeemed',
      'dateTime': 'May 29, 2025 at 3:45 PM',
      'location': 'Riyadh – Al Olaya branch',
      'image': AppImages.historyImage,
    },
    {
      'title': 'Fashion Hub',
      'discount': '25% off',
      'status': 'Redeemed',
      'dateTime': 'May 29, 2025 at 3:45 PM',
      'location': 'Riyadh – Al Olaya branch',
      'image': AppImages.historyImage,
    },
    {
      'title': 'Fashion Hub',
      'discount': '25% off',
      'status': 'Redeemed',
      'dateTime': 'May 29, 2025 at 3:45 PM',
      'location': 'Riyadh – Al Olaya branch',
      'image': AppImages.historyImage,
    },
    {
      'title': 'Fashion Hub',
      'discount': '25% off',
      'status': 'Expired',
      'dateTime': 'May 29, 2025 at 3:45 PM',
      'location': 'Riyadh – Al Olaya branch',
      'image': AppImages.historyImage,
    },
    {
      'title': 'Fashion Hub',
      'discount': '25% off',
      'status': 'Expired',
      'dateTime': 'May 29, 2025 at 3:45 PM',
      'location': 'Riyadh – Al Olaya branch',
      'image': AppImages.historyImage,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarProfile(title: "My Redemptions", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack(), showIcon: false),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [

            ///===========Card Section================
            Expanded(
              child: ListView.builder(
                itemCount: redemptionHistory.length,
                itemBuilder: (context, index) {
                  final item = redemptionHistory[index];
                  final statusColor = item['status'] == 'Expired'
                      ? AppColors.cFFEDE6
                      : AppColors.cE8E8E8;

                  return Container(
                    height: 160.h,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: AppColors.cFFEDE6),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(item['image']),
                          UIHelper.horizontalSpace(16.h),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item['title'],
                                      style: TextFontStyle
                                          .titleStyle16w500primary2Manrope
                                          .copyWith(
                                          color: AppColors.c181818,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      height: 24.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(24.r),
                                        color: statusColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          item['status'],
                                          style: TextFontStyle
                                              .titleStyle16w500primary2Manrope
                                              .copyWith(
                                              color: AppColors.c181818,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                UIHelper.verticalSpace(6.h),
                                Text(
                                  item['discount'],
                                  style: TextFontStyle
                                      .titleStyle16w500primary2Manrope
                                      .copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w400),
                                ),
                                UIHelper.verticalSpace(6.h),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.clockIcon,
                                      width: 18,
                                      height: 18,
                                      placeholderBuilder: (_) =>
                                      const Icon(Icons.access_time),
                                    ),
                                    UIHelper.horizontalSpace(8.w),
                                    Expanded(
                                      child: Text(
                                        item['dateTime'],
                                        style: TextFontStyle
                                            .titleStyle16w500primary2Manrope
                                            .copyWith(
                                            color: AppColors.c757575,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                UIHelper.verticalSpace(6.h),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.location2,
                                      width: 18,
                                      height: 18,
                                      placeholderBuilder: (_) =>
                                      const Icon(Icons.location_on),
                                    ),
                                    UIHelper.horizontalSpace(8.w),
                                    Expanded(
                                      child: Text(
                                        item['location'],
                                        style: TextFontStyle
                                            .titleStyle16w500primary2Manrope
                                            .copyWith(
                                            color: AppColors.c757575,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
