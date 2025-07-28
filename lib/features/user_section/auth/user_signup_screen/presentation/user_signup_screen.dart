
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/features/merchant/merchant_auth/merchant_signup/widget/social_login_button.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';




class UserSignupScreen extends StatefulWidget {
  const UserSignupScreen({super.key});

  @override
  State<UserSignupScreen> createState() => _UserSignupScreenState();
}

class _UserSignupScreenState extends State<UserSignupScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;




  ///=========== Validation function for user name

  String? _validateUserName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }

    final RegExp nameRegExp = RegExp(r'^[A-Za-z]+(?: [A-Za-z]+)*$');

    if (!nameRegExp.hasMatch(value.trim())) {
      return "Only letters and single spaces allowed";
    }

    if (value.trim().length < 2) {
      return "Name must be at least 2 characters";
    }

    return null;
  }



  ///============== Validation function for email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  ///=================Validation function for password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please retype your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    try {
      NavigationService.navigateToWithArgs(Routes.userSignupOtpVerificationScreen,{
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
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  ///===============Title==================///
                  Text(
                    textAlign: TextAlign.center,
                    "Suki Discounts.",
                    style: TextFontStyle.titleStyle40w400WhiteMarcellusSc.copyWith(
                      color: AppColors.primary2,
                    ),

                  ),


                  UIHelper.verticalSpace(5.h),
                  ///===============Subtitle==================///
                  Text(
                    textAlign: TextAlign.center,
                    "Hello! Register to get started",
                    style: TextFontStyle.titleStyle24w600primary2Manrope.copyWith(
                      color: AppColors.c181818, fontWeight: FontWeight.bold,
                    ),
                  ),

                  UIHelper.verticalSpace(6.h),

                  ///===============User Name==================///
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      textAlign: TextAlign.start,
                      "User name",
                      style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                        color: AppColors.c2F2F2F,
                      ),

                    ),
                  ),
                  UIHelper.verticalSpace(8.h),

                  CustomTextfield(
                    borderColor: AppColors.cE8E8E8,
                    fillColor: AppColors.white,
                    controller: userNameController,
                    hintText: "Enter your first name",
                    validator: _validateUserName,
                    prefixIcon: const Icon(Icons.account_circle_outlined, color: Colors.grey),
                  ),

                  UIHelper.verticalSpace(8.h),

                  ///===============Email==================///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                          color: AppColors.c2F2F2F,
                        ),

                      ),
                    ],
                  ),

                  UIHelper.verticalSpace(8.h),

                  // Password Field
                  CustomTextfield(

                    borderColor: AppColors.cE8E8E8,
                    fillColor: AppColors.white,
                    hintText: 'Enter your email',
                    controller: emailController,
                    isObsecure: false,
                    validator: _validateEmail,
                    prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
                  ),

                  UIHelper.verticalSpace(8.h),

                  ///===============Password==================///

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                          color: AppColors.c2F2F2F,
                        ),

                      ),
                    ],
                  ),

                  UIHelper.verticalSpace(8.h),

                  CustomTextfield(
                    borderColor: AppColors.cE8E8E8,
                    fillColor: AppColors.white,
                    hintText: 'Enter your password',
                    controller: passwordController,
                    isObsecure: true,
                    isPass: true,
                    validator: _validatePassword,
                    prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                  ),

                  UIHelper.verticalSpace(8.h),
                  ///=============Confirm Password========
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        " Confirm Password",
                        style: TextFontStyle.titleStyle16w500primary2Manrope
                            .copyWith(
                          color: AppColors.c2F2F2F,
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(8.h),

                  CustomTextfield(
                    borderColor: AppColors.cE8E8E8,
                    fillColor: AppColors.white,
                    hintText: 'Enter confirm Password',
                    controller: confirmPassword,
                    isObsecure: true,
                    isPass: true,
                    validator: _validatePassword,
                    prefixIcon:
                    const Icon(Icons.lock_outline, color: Colors.grey),
                  ),

                  UIHelper.verticalSpace(8.h),

                  ///===============Forgot Password ==================///

                  SizedBox(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        // Handle forgot password action
                        NavigationService.navigateTo(Routes.userForgotPasswordScreen);
                      },
                      child: Text(
                        textAlign: TextAlign.end,
                        "Forgot Password?",
                        style: TextFontStyle.titleStyle14w400grey888E9CManrope.copyWith(
                          color: AppColors.c757575,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  UIHelper.verticalSpace(8.h),

                  ///===============Login Button==================///

                  CustomButton(
                    name: "Sign Up",
                    onCallBack: _signup,
                    context: context,
                    color: AppColors.primary2,
                    height: 56.h,
                    borderRadius: 8.r,
                    textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
                  ),

                  UIHelper.verticalSpace(12.h),

                  ///===============Or Login with==================///
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withOpacity(.7),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                            "Or Login with",
                            style: TextFontStyle.titleStyle14w400grey888E9CManrope
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withOpacity(.7),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  UIHelper.verticalSpace(8.h),

                  ///===============Social Media Login Buttons==================///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google Button
                      SocialLoginButton(
                        icon: SvgPicture.asset(AppIcons.google),
                        onPressed: () {
                          // Handle Google login
                        },
                      ),

                      SizedBox(width: 32.w),

                      // Apple Button
                      SocialLoginButton(
                        icon: SvgPicture.asset(AppIcons.apple),
                        onPressed: () {
                          // Handle Apple login
                        },
                      ),
                    ],
                  ),

                  UIHelper.verticalSpace(8.h),

                  ///===============Don't have an account? Register Now==================///
                  SizedBox(
                    width: double.infinity,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                              color: AppColors.c2F2F2F, fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                NavigationService.navigateTo(Routes.userLoginScreen);
                              },
                            text: "Login Now",
                            style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                              color: AppColors.primary2, fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
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

// Reusable social login button widget
