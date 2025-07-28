
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widget/advertiser_verification_dialog_box.dart';

class AdvertiserForgotOtpVerificationScreen extends StatefulWidget {
  const AdvertiserForgotOtpVerificationScreen({super.key, required this.email});
  final String email;

  @override
  State<AdvertiserForgotOtpVerificationScreen> createState() =>
      _AdvertiserForgotOtpVerificationScreenState();
}

class _AdvertiserForgotOtpVerificationScreenState
    extends State<AdvertiserForgotOtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isResendLoading = false;
  bool _isRegisterHovered = false;
  int _resendCountdown = 30;

  @override
  void initState() {
    super.initState();
    _startResendCountdown();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _startResendCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_resendCountdown > 0 && mounted) {
        setState(() => _resendCountdown--);
        _startResendCountdown();
      }
    });
  }

  Future<void> _verifyOtp() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    try {

      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return VerificationSuccessDialog(
              onVerify: () {
                NavigationService.navigateTo(Routes.advertiserResetPasswordScreen);
                Navigator.pushNamed(context, '/home');
              },
            );
          },
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification failed: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }


  Future<void> _resendOtp() async {
    setState(() {
      _isResendLoading = true;
      _resendCountdown = 30;
    });

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Replace with actual resend OTP logic:
      // await AuthService.resendOtp(email: widget.email);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP resent successfully')),
      );
      _startResendCountdown();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to resend OTP: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isResendLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppbarProfile(title: "", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,),
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w,),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpace(35.h),

                  ///============ Title and Subtitle ============///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "OTP Verification",
                        style: TextFontStyle.titleStyle32w600c2F2F2FManrope,
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text("We have sent verification code to your email ",
                              style: TextFontStyle
                                  .titleStyle14w400grey888E9CManrope
                                  .copyWith(
                                color: AppColors.c757575,
                              )),
                          Text(widget.email,
                              style: TextFontStyle
                                  .titleStyle14w400grey888E9CManrope
                                  .copyWith(
                                color: AppColors.c757575,
                              )),
                        ],
                      ),
                    ],
                  ),

                  UIHelper.verticalSpace(66.h),

                  ///============ OTP Input Field ============///
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 4,
                        controller: _otpController,
                        enablePinAutofill: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter OTP';
                          }
                          if (value.length < 4) {
                            return 'Please enter complete OTP';
                          }
                          return null;
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(24.r),
                          fieldHeight: 48.h,
                          fieldWidth: 48.w,
                          activeFillColor: AppColors.cF3F3F3,
                          activeColor: AppColors.cF3F3F3,
                          selectedColor: AppColors.cF3F3F3,
                          inactiveColor: AppColors.primary,
                          selectedFillColor: AppColors.cF3F3F3,
                          inactiveFillColor: AppColors.white,
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        enableActiveFill: true,
                        textStyle: TextFontStyle.titleStyle20w600c182245Manrope,
                        onChanged: (value) {},
                      ),
                    ),
                  ),

                  UIHelper.verticalSpace(58.h),

                  ///==============Resend OTP=======================
                  Align(
                    alignment: Alignment.center,
                    child: _resendCountdown > 0
                        ? Text(
                      "Resend OTP in $_resendCountdown seconds",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                      ),
                    )
                        : TextButton(
                      onPressed: _isResendLoading ? null : _resendOtp,
                      child: _isResendLoading
                          ? SizedBox(
                        height: 16.h,
                        width: 16.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primary,
                        ),
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Didn’t received code?",
                              style: TextFontStyle
                                  .titleStyle14w400grey888E9CManrope
                                  .copyWith(
                                color: AppColors.c1C1D20,
                              )),
                          Text(' Resend',
                              style: TextFontStyle
                                  .titleStyle14w400grey888E9CManrope
                                  .copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ),
                  ),

                  UIHelper.verticalSpace(180.h),

                  ///============ Verify Button ============///
                  CustomButton(
                    name: "Verify",
                    onCallBack: _verifyOtp,
                    context: context,

                   color: AppColors.primary2,
                    height: 56.h,
                    // isLoading: _isLoading,
                    borderRadius: 8.r,
                    textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
                  ),

                  UIHelper.verticalSpace(16.h),



                  Center(
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _isRegisterHovered = true),
                      onExit: (_) => setState(() => _isRegisterHovered = false),
                      child: GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(Routes.advertiserLoginScreen);
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  decoration: _isRegisterHovered
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  UIHelper.verticalSpace(24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

