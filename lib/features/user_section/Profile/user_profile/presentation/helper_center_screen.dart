
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_help_center_button.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class userHelperCenterScreen extends StatefulWidget {
  const userHelperCenterScreen({super.key});

  @override
  State<userHelperCenterScreen> createState() => _userHelperCenterScreenState();
}

class _userHelperCenterScreenState extends State<userHelperCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,

      appBar: CustomAppbarProfile(
        title: "Help Center",
        iconPath: AppIcons.backArrowIcon,
        onIconTap: () => NavigationService.goBack,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric( horizontal: 24.w),
        child: Column(
          children: [
            UIHelper.verticalSpace(24.h),

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
