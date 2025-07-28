
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/features/splash_&_onboarding/onboarding_screen/widget/user_button_card.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String currentImage = AppImages.splash;
  String headerTitle = "Create an account as";
  String subTitle = "Choose your role to continue. Your experience will be personalized based on how you use the platform.";
  String? selectedRole; // Track the selected role

  void updateContent(String role) {
    setState(() {
      selectedRole = role; // Store the selected role
      switch (role) {
        case 'Customer':
          currentImage = AppImages.splash;
          headerTitle = "Create an account as";
          subTitle = "Choose your role to continue. Your experience will be personalized based on how you use the platform.";
          break;
        case 'Merchant':
          currentImage = AppImages.splash1;
          headerTitle = "Create an account as";
          subTitle = "Choose your role to continue. Your experience will be personalized based on how you use the platform.";
          break;
        case 'Advertisers':
          currentImage = AppImages.splash2;
          headerTitle = "Create an account as";
          subTitle = "Choose your role to continue. Your experience will be personalized based on how you use the platform.";
          break;
        default:
          currentImage = AppImages.splash;
          headerTitle = "Create an account as";
          subTitle = "Choose your role to continue. Your experience will be personalized based on how you use the platform.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: 16.w),
          child: Column(
            children: [
              UIHelper.verticalSpace(48.h),

              ///============= Header Section================
              Text(
                headerTitle,
                style: TextFontStyle.titleStyle24w600primary2Manrope,
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                textAlign: TextAlign.center,
                subTitle,
                style: TextFontStyle.titleStyle14w400grey888E9CManrope.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              UIHelper.verticalSpace(32.h),

              ///============= Image Section================
              Container(
                width: 240.w,
                height: 240.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(currentImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              UIHelper.verticalSpace(16.h),

              ///============= User Button Card Section================
              UserButtonCard(
                timeSlots: [
                  ['Customer'],
                  ['Merchant'],
                  ['Advertisers'],
                ],
                onRoleSelected: updateContent,
              ),

              UIHelper.verticalSpace(32.h),

              ///============= Next Button Section================
              CustomButton(
                name: "Next",
                onCallBack: () {
                  if (selectedRole == "Customer") {
                    print("Selected role: $selectedRole"); // Print the selected role
                    NavigationService.navigateTo(Routes.userLoginScreen);
                  }
                  else if (selectedRole == "Merchant") {
                    print("Selected role: $selectedRole"); // Print the selected role
                    NavigationService.navigateTo(Routes.merchantLoginScreen);
                  }

                  else if (selectedRole == "Advertisers") {
                    print("Selected role: $selectedRole"); // Print the selected role
                    NavigationService.navigateTo(Routes.advertiserLoginScreen);
                  }

                  else {
                    // Show an error if no role is selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select a role")),
                    );
                  }
                },
                context: context,
                color: AppColors.primary2,
                height: 56.h,
                borderRadius: 8.r,
                textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
              ),

            ],
          ),
        ),
      ),
    );
  }
}