
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MerchantNotificationScreen extends StatefulWidget {
  const MerchantNotificationScreen({super.key});

  @override
  State<MerchantNotificationScreen> createState() =>
      _MerchantNotificationScreenState();
}

class _MerchantNotificationScreenState
    extends State<MerchantNotificationScreen> {


  final List<String> notificationIcon = [
    'assets/icons/clock.svg',
    'assets/icons/alert-02-stroke.svg',
    'assets/icons/tick-04-solid.svg',
  ];

  final List<String> title = [
    'Expired',
    'Reject',
    'Approved',

  ];

  final List<String> subtitle = [
    'Your offer “50% Off Burger Combo” expired on June 5, 2025 at 11:59 PM.',
    'Your offer “Free Delivery Over ৳500” was rejected on June 3, 2025.',
    'Your offer “Buy 1 Get 1 Pizza” was approved on June 2, 2025 and is now live.',

  ];

  final List<String> time = [
    '2 minutes ago',
    'Yesterday',
    'Yesterday',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarProfile(title: "Notification", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,),
      backgroundColor: AppColors.cFFFFFF,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            UIHelper.verticalSpace(18.h),
            ///==========ListView builder================
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
                      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
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
          ],
        ),
      ),
    );
  }
}