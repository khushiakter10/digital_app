
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/features/user_section/auth/user_forgot_password/widget/forget_pass_dilog_box.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserUpdatePassword extends StatefulWidget {
  const UserUpdatePassword({super.key});

  @override
  State<UserUpdatePassword> createState() => _UserUpdatePasswordState();
}

class _UserUpdatePasswordState extends State<UserUpdatePassword> {

  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  ///=================Validation function for password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _userUpdatePassword() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
     UserUpdatePasswordDialogBox(context: context,callback:  () {NavigationService.navigateTo(Routes.userMainBottomNavScreen);},title:  "", subTitle: "",buttonTitle: "Continue");

      // // Navigate to home screen after successful registration
      // NavigationService.navigateToWithArgs(Routes.signupOtpVerificationScreen,{
      //   "email": emailController.text
      // });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Update password failed: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,

      appBar: CustomAppbarProfile(
        title: "Update Password ",
        iconPath: AppIcons.backArrowIcon,
        onIconTap: () => NavigationService.goBack,
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                UIHelper.verticalSpace(24.h),

                ///===============Password Section All ==================///

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(" Current Password",   style: TextFontStyle.titleStyle14w500c2F2F2FManrope .copyWith( fontSize: 16.sp)),


                  ],
                ),

                UIHelper.verticalSpace(8.h),

                CustomTextfield(
                  hintTextSyle: TextFontStyle.titleStyle14w400c757575Manrope,
                  borderColor: AppColors.cE8E8E8,
                  fillColor: AppColors.cFFFFFF,
                  hintText: 'Password',
                  controller: currentPasswordController,
                  isObsecure: true,
                  isPass: true,
                  validator: _validatePassword,
                  prefixIcon:
                  const Icon(Icons.lock_outline, color: Colors.grey),
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      " New Password",
                      style: TextFontStyle.titleStyle16w500primary2Manrope
                          .copyWith(
                        color: AppColors.c2F2F2F,
                      ),
                    ),
                  ],
                ),

                UIHelper.verticalSpace(8.h),

                CustomTextfield(
                  hintTextSyle: TextFontStyle.titleStyle14w400c757575Manrope,
                  borderRadius: 16.r,
                  borderColor: AppColors.cE8E8E8,
                  fillColor: AppColors.cFFFFFF,
                  hintText: 'Password',
                  controller: newPasswordController,
                  isObsecure: true,
                  isPass: true,
                  validator: _validatePassword,
                  prefixIcon:
                  const Icon(Icons.lock_outline, color: Colors.grey),
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      " Confirm New Password",
                      style: TextFontStyle.titleStyle16w500primary2Manrope
                          .copyWith(
                        color: AppColors.c2F2F2F,
                      ),
                    ),
                  ],
                ),

                UIHelper.verticalSpace(8.h),

                CustomTextfield(
                  hintTextSyle: TextFontStyle.titleStyle14w400c757575Manrope,
                  borderRadius: 16.r,
                  borderColor: AppColors.cE8E8E8,
                  fillColor: AppColors.cFFFFFF,
                  hintText: 'Password',
                  controller: confirmNewPasswordController,
                  isObsecure: true,
                  isPass: true,
                  validator: _validatePassword,
                  prefixIcon:
                  const Icon(Icons.lock_outline, color: Colors.grey),
                ),

                UIHelper.verticalSpace(220.h),

                ///===============Update Password Button==================///
                ///
                CustomButton(
                  name: "Update Password",
                  onCallBack: _userUpdatePassword,
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
      ),
    );
  }
}

// Reusable social login button widget