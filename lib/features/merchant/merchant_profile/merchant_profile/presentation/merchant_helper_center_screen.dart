
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_help_center_button.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MerchantHelperCenterScreen extends StatefulWidget {
  const MerchantHelperCenterScreen({super.key});

  @override
  State<MerchantHelperCenterScreen> createState() =>
      _MerchantHelperCenterScreenState();
}

class _MerchantHelperCenterScreenState
    extends State<MerchantHelperCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarProfile(
        title: "Helper Center",
        iconPath: AppIcons.backArrowIcon,
        onIconTap: () => NavigationService.goBack,
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            UIHelper.verticalSpace(18.h),
            CustomHelpCenterButton(
              text: 'Click Me',
              iconPath: AppIcons.contactIcon,
              onTap: () {
                print('Button tapped!');
              },
            ),
            UIHelper.verticalSpace(16.h),
            CustomHelpCenterButton(
              text: 'Click Me',
              iconPath: AppIcons.whatsAppIcon,
              onTap: () {
                print('Button tapped!');
              },
            ),
            UIHelper.verticalSpace(16.h),
            CustomHelpCenterButton(
              text: 'Click Me',
              iconPath: AppIcons.instagramIcon,
              onTap: () {
                print('Button tapped!');
              },
            ),
            UIHelper.verticalSpace(16.h),
            CustomHelpCenterButton(
              text: 'Click Me',
              iconPath: AppIcons.facebookIcon,
              onTap: () {
                print('Button tapped!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
