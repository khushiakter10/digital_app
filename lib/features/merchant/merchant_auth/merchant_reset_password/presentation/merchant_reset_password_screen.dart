
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MerchantResetPasswordScreen extends StatefulWidget {
  const MerchantResetPasswordScreen({super.key});

  @override
  State<MerchantResetPasswordScreen> createState() =>
      _MerchantResetPasswordScreenState();
}

class _MerchantResetPasswordScreenState
    extends State<MerchantResetPasswordScreen> {
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController retypeNePassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please retype your password';
    }
    if (value != newPassword.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _merchantResetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    try {
      NavigationService.navigateToWithArgs(
        Routes.merchantLoginScreen,
        {"Password": retypeNePassword.text},
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    newPassword.dispose();
    retypeNePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbarProfile(title: "", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UIHelper.verticalSpace(89.h),

                  Text(
                    "Reset Password",
                    textAlign: TextAlign.center,
                    style: TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(fontSize: 32.sp),
                  ),
                  UIHelper.verticalSpace(12.h),
                  Text(
                    "We will send the OTP code to your phone number for security in forgetting your password",
                    textAlign: TextAlign.center,
                    style: TextFontStyle.titleStyle14w400c757575Manrope,
                  ),
                  UIHelper.verticalSpace(26.5.h),

                  /// New Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "New password",
                        style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                          color: AppColors.c2F2F2F,
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(8.h),
                  CustomTextfield(
                    borderColor: AppColors.c757575,
                    fillColor: AppColors.white,
                    hintText: 'Password',
                    controller: newPassword,
                    isObsecure: true,
                    isPass: true,
                    validator: _validatePassword,
                  ),

                  UIHelper.verticalSpace(19.5.h),

                  /// Re-type New Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Re-type new password",
                        style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                          color: AppColors.c2F2F2F,
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(8.h),
                  CustomTextfield(
                    borderColor: AppColors.c757575,
                    fillColor: AppColors.white,
                    hintText: 'Password',
                    controller: retypeNePassword,
                    isObsecure: true,
                    isPass: true,
                    validator: _validatePassword,
                  ),

                  UIHelper.verticalSpace(180.h),

                  /// Button
                  CustomButton(
                    name: _isLoading ? "Please wait..." : "Reset Password",
                    onCallBack: _merchantResetPassword,
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
      ),
    );
  }
}


