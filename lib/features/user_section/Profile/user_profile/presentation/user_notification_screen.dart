
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserNotificationScreen extends StatefulWidget {
  const UserNotificationScreen({super.key});

  @override
  State<UserNotificationScreen> createState() => _UserNotificationScreenState();
}

class _UserNotificationScreenState extends State<UserNotificationScreen> {
  List<bool> toggle = [false, false, false, false, false];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadToggleStates();
  }

  ///============ Load toggle states from SharedPreferences===============
  Future<void> _loadToggleStates() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      toggle[0] = prefs.getBool('App Notifications') ?? false;
      toggle[1] = prefs.getBool('Nearby Settings') ?? false;

    });
  }

  ///============ Save toggle states to SharedPreferences=============
  Future<void> _saveToggleStates() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('App Notifications', toggle[0]);
    await prefs.setBool('Nearby Settings', toggle[1]);

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,

      appBar: CustomAppbarProfile(
        title: "Notification",
        iconPath: AppIcons.backArrowIcon,
        onIconTap: () => NavigationService.goBack,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric( horizontal: 24.w),
        child: Column(
          children: [
            UIHelper.verticalSpace(34.h),

            buildToggleButton('App Notifications', 'Receive app updates and alerts', 0, AppIcons.notificationIcon3),
            UIHelper.verticalSpace(24.h),
            buildToggleButton('Nearby Settings', 'Get notified about nearby deals', 1, AppIcons.notificationIcon3),

          ],
        ),
      ),
    );
  }

  Widget buildToggleButton(String title, String subtitle, int index, String iconPath) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24.w,
            height: 24.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: SvgPicture.asset(
              iconPath,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: 230.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,style: TextFontStyle.titleStyle16w400c181818FManrope,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )

                    ],
                  ),
                ),
                UIHelper.verticalSpace(4.h),
                SizedBox(
                  width: 235.w,
                  child: Text(
                    subtitle,
                    style: TextFontStyle.titleStyle14w400c757575Manrope,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          ///======================= Trailing toggle button===================
          GestureDetector(
            onTap: isLoading
                ? null
                : () async {
              setState(() {
                toggle[index] = !toggle[index];
              });
              await _saveToggleStates();
              // await updateNotificationSettings(index);
            },
            child: Container(
              width: 40.w,
              height: 40.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(
                alignment: toggle[index] ? Alignment.centerRight : Alignment.centerLeft,
                children: [
                  Container(
                    width: 40.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: toggle[index] ? AppColors.primary2 : AppColors.cD1D1D1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 20.w,
                      height: 20.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.cFFFFFF,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}