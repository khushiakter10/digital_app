
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
import 'package:flutter_svg/flutter_svg.dart';

class MerchantForgetPassword extends StatefulWidget {
  const MerchantForgetPassword({super.key});

  @override
  State<MerchantForgetPassword> createState() =>
      _MerchantForgetPasswordState();
}

class _MerchantForgetPasswordState
    extends State<MerchantForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> _merchantSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    try {
      NavigationService.navigateToWithArgs(Routes.merchantForgotOtpVerification,{
        "email": emailController.text
      });
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
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarProfile(title: "Forgot Password", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(90.h),

                Center(
                  child: Text(
                    'Forgot Password',
                    style: TextFontStyle.titleStyle18w600c2F2F2FManrope
                        .copyWith(fontSize: 32.sp),
                  ),
                ),
                UIHelper.verticalSpace(12.h),

                Center(
                  child: Text(
                    'We will send the OTP code to your email number for security in forgetting your password',
                    textAlign: TextAlign.center,
                    style: TextFontStyle.headline12w400c5C5C5C,
                  ),
                ),

                UIHelper.verticalSpace(26.h),

                Text(
                  "Email",
                  style: TextFontStyle.titleStyle16w500primary2Manrope
                      .copyWith(color: AppColors.c2F2F2F),
                ),
                UIHelper.verticalSpace(12.h),

                CustomTextfield(
                  controller: emailController,
                  hintText: 'Enter your email',
                  validator: _validateEmail,
                  borderColor: AppColors.cE8E8E8,
                  fillColor: AppColors.white,
                ),

                UIHelper.verticalSpace(294.h),

                CustomButton(
                  name: _isLoading ? "Please wait..." : "Continue",
                  onCallBack: _merchantSubmit,
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





