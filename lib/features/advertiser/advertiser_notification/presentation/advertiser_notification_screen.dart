
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AdvertiserNotificationScreen extends StatefulWidget {
  const AdvertiserNotificationScreen({super.key});

  @override
  State<AdvertiserNotificationScreen> createState() =>
      _AdvertiserNotificationScreenState();
}

class _AdvertiserNotificationScreenState
    extends State<AdvertiserNotificationScreen> {
  final List<String> notificationIcon = [
    'assets/icons/lenceIcon.svg',
    'assets/icons/loveIcon.svg',
    'assets/icons/shared_copy.svg',
    'assets/icons/ad_alaert.svg',
    'assets/icons/calendar-03-.svg',
  ];

  final List<String> title = [
    'Views Update',
    'Likes Milestone',
    'Shared by Users',
    'Ad Performance Alert',
    'Campaign Ending Soon',
  ];

  final List<String> subtitle = [
    'Great! Your visibility is increasing steadily.',
    'Your ad is trending among young audiences.',
    'More shares = More reach',
    'Consider updating visuals or changing categories.',
    'Renew or extend to keep the momentum going.',
  ];

  final List<String> time = [
    '2 hours ago',
    'Today',
    'Yesterday',
    '2 days ago',
    '2 days ago',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppbarProfile(title: " Notification", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
        child: Column(
          children: [

            //------------------------------------------- List View ---------------------------------------------------//

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notificationIcon.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: AppColors.cFFE4D9, width: 1.w),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 12.w),
                            decoration: BoxDecoration(
                              color: AppColors.cF3F3F3,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: SvgPicture.asset(
                              notificationIcon[index],
                              height: 24.h,
                            ),
                          ),
                          UIHelper.horizontalSpace(16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title[index],
                                  style: TextFontStyle.titleStyle14w600c000000Manrope,
                                ),
                                UIHelper.verticalSpace(4.h),
                                Text(
                                  subtitle[index],
                                  style: TextFontStyle.titleStyle14w500c757575Manrope,
                                ),
                                UIHelper.verticalSpace(8.h),
                                Text(
                                  time[index],
                                  style: TextFontStyle.titleStyle14w500c757575Manrope.copyWith(fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
//------------------------------------------ Done ----------------------------------------------------//
          ],
        ),
      ),
    );
  }
}