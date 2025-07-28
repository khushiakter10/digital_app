
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/features/advertiser/advertiser_home/widget/advertise_custom_add_offer.dart';
import 'package:digital_app/features/advertiser/advertiser_home/widget/recent_widget.dart';
import 'package:digital_app/features/advertiser/advertiser_home/widget/redemptions_today_widget.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdvertiserHomeScreen extends StatefulWidget {
  const AdvertiserHomeScreen({super.key});

  @override
  State<AdvertiserHomeScreen> createState() => _AdvertiserHomeScreenState();
}

class _AdvertiserHomeScreenState extends State<AdvertiserHomeScreen> {

  final List<String> imageIcon = [
    'assets/icons/active_adds.svg',
    'assets/icons/tody.svg',
    'assets/icons/clock.svg',
    'assets/icons/dollerIcon.svg',
  ];

  final List<String> title = [
    '03',
    '1200',
    '156 Hour',
    '\$4,200',
  ];

  final List<String> subtitle = [
    'Active Adds',
    'Weekly Views',
    'Total Time Viewd',
    'Estimated Value',
  ];

  final List<String> newaddIcon = [
    'assets/icons/addoffer.svg',
    'assets/icons/notification (2).svg',
    'assets/icons/addoffer.svg',
    'assets/icons/notification (2).svg',
  ];

  final List<String> text = [
    'New Adds',
    'Notification',
    'New Adds',
    'Notification',
  ];

  void navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        NavigationService.navigateTo(Routes.advertiserCreateNewAdScreen);
        break;
      case 1:
        NavigationService.navigateTo(Routes.advertiserNotificationScreen);
        break;
    }
  }

  final List<String> qrIcon = [
    'assets/icons/qricon.svg',
    'assets/icons/qricon.svg',
    'assets/icons/qricon.svg',
  ];

  final List<String> recentText = [
    'Your ad was viewed 45 times today',
    'Your ad was viewed 45 times today',
    'Top Ad This Week',
  ];

  final List<String> minText = [
    '5 mins ago',
    '22 mins ago',
    'Today',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF9FAFB,
      appBar: CustomAppbarProfile(title: "Welcome Back,  Taco Spot Ad", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,showIcon: false,textSize: 17,),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          children: [
            GridView.builder(

              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              shrinkWrap: true,
              itemCount: imageIcon.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: (1.1 / 1),
              ),
              itemBuilder: (BuildContext context, int index) {
                return AdvertiserRedemptionsTodayWidget(
                  icon: imageIcon[index],
                  title: title[index],
                  subtitle: subtitle[index],
                );
              },
            ),
            UIHelper.verticalSpace(24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: SizedBox(
                height: 120.h,
                width: double.infinity,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: newaddIcon.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AdvertiseCustomAddOffer(
                      scanIcon: SvgPicture.asset(newaddIcon[index], height: 24.h),
                      text: text[index],
                      onTap: () => navigateToScreen(context, index),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 100.h);
                  },
                ),
              ),
            ),
            UIHelper.verticalSpace(24.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Activity',
                    style: TextFontStyle.titleStyle18w600c000000Manrope,
                  ),
                  ...List.generate(qrIcon.length, (index) {
                    return AdvertiserRecentWidget(
                      qrIcon: SvgPicture.asset(qrIcon[index]),
                      title: recentText[index],
                      subtitle: minText[index],
                      showDivider: index != qrIcon.length - 1,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
