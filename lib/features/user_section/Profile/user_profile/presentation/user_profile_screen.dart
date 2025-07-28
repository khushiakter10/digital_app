
import 'dart:io';
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/features/advertiser/advertiser-profile/widget/custom_dialouge_box.dart';
import 'package:digital_app/features/merchant/merchant_profile/merchant_profile/presentation/widget/profile_card_section.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cF5F5F5,
        body: SingleChildScrollView(
          child: Column(
            children: [

//---------------------------------- Profile Section --------------------------------------------------//
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius:
                  BorderRadius.circular(12.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 47.r,
                              backgroundColor: AppColors.cFFF7F5,
                              child: Image.asset(AppImages.saraProfile)

                            ),
                          ],
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(16.h),
                    Text(
                      "Sarah Jhonson",style: TextFontStyle.titleStyle18w500c1C1D20Manrope,
                    ),
                    Text(
                      "sarah@gmail.com",style: TextFontStyle.titleStyle16w400c888E9CManrope,
                    ),
                    Text('CUST-1287XZ',style: TextFontStyle.titleStyle12w500cFF4800Manrope.copyWith(fontSize: 16.sp),)

                  ],
                ),
              ),
              UIHelper.verticalSpace(16.h),
//------------------------------------------ Done -----------------------------------------------//
//---------------------------------------- Subscription Section ----------------------------------//
              Container(
                height: 210.h,
                margin: EdgeInsets.all(12),
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.white, width: 2),
                    borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Subscription Status",style: TextFontStyle.titleStyle32w600c2F2F2FManrope.copyWith(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppIcons.premiumPlanIcon),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                                "Premium Plan",style: TextFontStyle.titleStyle32w600c2F2F2FManrope.copyWith(fontSize: 18.sp)
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppIcons.activeIcon),
                            UIHelper.horizontalSpace(8.w),
                            Text(
                                "Active",
                                style: TextFontStyle
                                    .titleStyle14w500c34A853Manrope

                            ),
                          ],
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Next billing date: June 30, 2025", style: TextFontStyle.titleStyle14w500c757575Manrope),
                      ],
                    ),
                    UIHelper.verticalSpace(16.h),
                    CustomButton(
                        color: AppColors.cFF4800,

                        name: "Manage Subscription",
                        onCallBack: () {

                          NavigationService.navigateTo(Routes.userSubscriptionScreen);

                        },
                        context: context)
                  ],
                ),
              ),

              UIHelper.verticalSpace(16.h),
//------------------------------------------- Done --------------------------------------------//


//-------------------------------------------- Account Setting Sectio ---------------------------------//

              Container(
                //height: 720.h,
                margin: EdgeInsets.all(12.sp),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.white, width: 2.w),
                    borderRadius: BorderRadius.circular(12.r)),

                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(  "Account Settings",style: TextFontStyle.titleStyle16w600c262629Manrope)),
                    UIHelper.verticalSpace(16.h),

                    ProfileCardSection(
                      text: "Edit Personal Info",
                      icon: AppIcons.settingIcon,
                      callback: () {
                        NavigationService.navigateTo(Routes.editPersonalInfoScreen);
                      },
                    ),
                    UIHelper.verticalSpace(16.h),
                    ProfileCardSection(
                      text: "Update Password",
                      icon: AppIcons.passwordKeyIcon,
                      callback: () {
                        NavigationService.navigateTo(Routes.userUpdatePassword);
                      },
                    ),
                    UIHelper.verticalSpace(16.h),

                    ProfileCardSection(
                      text: "Notification Settings",
                      icon: AppIcons.notificationIcon,
                      callback: () {
                        NavigationService.navigateTo(Routes.userNotificationScreen);
                      },
                    ),


                    UIHelper.verticalSpace(16.h),

                    Divider( height: 2.h, color: AppColors.cFFEDE6),

                    UIHelper.verticalSpace(16.h),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(   "Support",style: TextFontStyle.titleStyle32w600c2F2F2FManrope.copyWith(fontSize: 16.sp),
                      ),
                    ),
                    UIHelper.verticalSpace(16.h),

                    ProfileCardSection(
                      text: "Help Center",
                      icon: AppIcons.helperIcon,
                      callback: () {
                        NavigationService.navigateTo(Routes.userHelperCenterScreen);
                      },
                    ),
                    UIHelper.verticalSpace(8.h),
                    ProfileCardSection(
                      text: "Privacy Policy",
                      icon: AppIcons.lockIcon,
                      callback: () {
                        // NavigationService.navigateTo(Routes.personalInformation);
                      },
                    ),
                    UIHelper.verticalSpace(16.h),
                    Divider(
                      height: 2,
                      color: AppColors.cFFEDE6,
                    ),
                    UIHelper.verticalSpace(16.h),

                    ProfileCardSection(
                        text: "Log Out",
                        icon: AppIcons.logoutIcon,
                        callback: () {
                          showDeleteAccountDialog(
                              context,
                                  () {},
                              "Logging Out?",
                              "Are you sure want to Log out from your account?",
                              "Confirm");
                        }),
                    UIHelper.verticalSpace(8.h),
                    ProfileCardSection(
                        text: "Delete Account",
                        icon: AppIcons.deleteIcon,
                        callback: () {
                          showDeleteAccountDialog(
                              context,
                                  () {},
                              "Delete Account?",
                              "Are you sure want to permanently delete your account?",
                              "Confirm");
                        }),
                    UIHelper.verticalSpace(8.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}