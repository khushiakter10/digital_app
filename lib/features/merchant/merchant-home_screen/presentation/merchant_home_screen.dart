
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/features/merchant/merchant-home_screen/widget/custom_add_offer.dart';
import 'package:digital_app/features/merchant/merchant-home_screen/widget/recent_widget.dart';
import 'package:digital_app/features/merchant/merchant-home_screen/widget/redemptions_today_widget.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MerchantHomeScreen extends StatefulWidget {
  const MerchantHomeScreen({super.key});

  @override
  State<MerchantHomeScreen> createState() => _MerchantHomeScreenState();
}

class _MerchantHomeScreenState extends State<MerchantHomeScreen> {
  ///////////////////////////////////////  Redemptions Today ////////////////////////////////////////

  final List<String> imageIcon = [
    'assets/icons/tody.svg',
    'assets/icons/activeoffer.svg',
    'assets/icons/weekicon.svg',
    'assets/icons/coffee.svg',
  ];

  final List<String> title = [
    '22',
    '03',
    '36',
    'Coffee',
  ];

  final List<String> subtitle = [
    'Redemptions Today',
    'Active Offer',
    'Week Redemptions',
    'Top Performing',
  ];
  /////////////////////////////////////// Done ///////////////////////////////////////////////

/////////////////////////////////////// scanIcon ///////////////////////////////////////////////

  final List<String> scanIcon = [
    'assets/icons/addoffer.svg',
    'assets/icons/transaction.svg',
    'assets/icons/scan.svg',
    'assets/icons/notification (2).svg',
  ];

  final List<String> text = [
    'Add Offer',
    'Transaction log',
    'Scan QR',
    'Notification',
  ];


  void navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        NavigationService.navigateTo(Routes.basicInfoScreen);
        break;

      case 1:
        NavigationService.navigateTo(Routes.merchantTransactionLogScreen);
        break;
      case 2:
        NavigationService.navigateTo(Routes.merchantScanQrCodeScreen);
        break;
      case 3:
        NavigationService.navigateTo(Routes.merchantNotificationScreen);
        break;
    }
  }

/////////////////////////////////////// Done ///////////////////////////////////////////////

/////////////////////////////////////// qrIcon ///////////////////////////////////////////////

  final List<String> qrIcon = [
    'assets/icons/qricon.svg',
    'assets/icons/qricon.svg',
    'assets/icons/qricon.svg',
  ];

  final List<String> recentText = [
    '10% Off Lunch Deal redeemed',
    'QR scanned by customer #1287',
    '10% Off Lunch Deal redeemed',
  ];

  final List<String> minText = [
    '3 mins ago',
    '15 mins ago',
    '15 mins ago',
  ];
////////////////////////////////////////////////// Done ///////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backroundColor,
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: AppColors.cFFFFFF,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false, // Disables the back button
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns content to the left
          children: [
            Text(
              'Welcome Back, Latte Cafe',
              style: TextFontStyle.titleStyle18w600c2F2F2FManrope,
            ),
            UIHelper.verticalSpace(8.h),
            Container(
              decoration: BoxDecoration(
                color: AppColors.cF0FDF4,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 6.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Ensures Row takes only needed width
                  children: [
                    SvgPicture.asset(AppIcons.checkIcon, height: 24.h),
                    UIHelper.horizontalSpace(8.w),
                    Text(
                      'Your store is currently: Active',
                      style: TextFontStyle.titleStyle14w600c15803DManrope,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          children: [
    ///////////////////////////////////////// Redemption ///////////////////////////////////////////////////

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.h),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: imageIcon.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return RedemptionsTodayWidget(
                    icon: imageIcon[index],
                    title: title[index],
                    subtitle: subtitle[index],
                  );
                },
              ),
            ),
            UIHelper.verticalSpace(24.h),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: SizedBox(
                height: 120.h,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: scanIcon.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomAddOffer(
                      scanIcon: SvgPicture.asset(scanIcon[index], height: 24.h),
                      text: text[index],
                      onTap: () => navigateToScreen(context, index),
                    );
                  },
                ),
              ),
            ),
            UIHelper.verticalSpace(24.h),


    ///////////////////////////////////////// Recent  /////////////////////////////////////////////////////////////

            Container( padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('Recent Activity',  style: TextFontStyle.titleStyle18w600c000000Manrope),
                  UIHelper.verticalSpace(8.h),

                  ...List.generate(qrIcon.length, (index) {
                    return RecentWidget(
                      qrIcon: SvgPicture.asset(qrIcon[index]),
                      title: recentText[index],
                      subtitle: minText[index],
                      showDivider: index != qrIcon.length - 1,
                    );


                  }),
                ],
              ),
            ),

    ////////////////////////////////////// Done ////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
