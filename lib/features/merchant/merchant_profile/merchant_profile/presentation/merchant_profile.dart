
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:digital_app/features/merchant/merchant_profile/merchant_profile/presentation/widget/custom_dialouge_box.dart';
import 'package:digital_app/features/merchant/merchant_profile/merchant_profile/presentation/widget/profile_card_section.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MerchantProfile extends StatefulWidget {
  const MerchantProfile({super.key});

  @override
  State<MerchantProfile> createState() => _MerchantProfileState();
}

class _MerchantProfileState extends State<MerchantProfile> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cF5F5F5,
        body: SingleChildScrollView(
          child: Column(
            children: [

              ///=============Profile Image Section=======================
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                              child: Image.asset(AppImages.profileImage2)
                            ),

                          ],
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(16),
                    Text(
                      "Sarah Jhonson",
                      style:
                      TextFontStyle.titleStyle18w600c000000Manrope.copyWith(
                        color: AppColors.c000000,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(16.h),


              ///==================Account Setting Section====================
              Container(
                //height: 700.h,
                margin: EdgeInsets.all(12),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.white, width: 2),
                    borderRadius: BorderRadius.circular(12.r)),

                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Account Settings",
                        style: TextFontStyle.titleStyle16w500primary2Manrope
                            .copyWith(color: AppColors.c000000,fontWeight: FontWeight.w600),
                      ),
                    ),
                    UIHelper.verticalSpace(16.h),
                    ProfileCardSection(
                      text: "Edit Personal Info",
                      icon: AppIcons.settingIcon,
                      callback: () {
                        NavigationService.navigateTo(Routes.merchantEditPersonalInfoScreen);
                      },
                    ),
                    UIHelper.verticalSpace(16.h),

                    ProfileCardSection(
                      text: "Edit Store Info",
                      icon:  AppIcons.editStorIcons,
                      callback: () {
                        NavigationService.navigateTo(Routes.merchantEditStorInformationScreen);
                      },
                    ),
                    UIHelper.verticalSpace(16.h),

                    ProfileCardSection(
                      text: "Update Password",
                      icon: AppIcons.passwordKeyIcon,
                      callback: () {
                        NavigationService.navigateTo(Routes.merchantUpdatePasswordScreen);
                      },
                    ),
                    UIHelper.verticalSpace(16.h),
                    ProfileCardSection(
                      text: "Notification Settings",
                      icon: AppIcons.notificationIcon,
                      callback: () {
                        NavigationService.navigateTo(Routes.merchantNotificationScreen);
                      },
                    ),


                    UIHelper.verticalSpace(16.h),
                    Divider(
                      height: 2,
                      color: AppColors.cFFEDE6,
                    ),
                    UIHelper.verticalSpace(16.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Support",
                        style: TextFontStyle.titleStyle16w500primary2Manrope
                            .copyWith(color: AppColors.c000000,fontWeight: FontWeight.w600),
                      ),
                    ),
                    UIHelper.verticalSpace(16.h),
                    ProfileCardSection(
                      text: "Help Center",
                      icon: AppIcons.helperIcon,
                      callback: () {
                        NavigationService.navigateTo(Routes.merchantHelperCenterScreen);
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