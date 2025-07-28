//
//
//
// //--------------------- Loading ------------------------//
//
//
//
//
// // import 'package:brayne_digital_app/assets_helper/app_colors.dart';
// // import 'package:brayne_digital_app/assets_helper/app_fonts.dart';
// // import 'package:brayne_digital_app/assets_helper/app_icons.dart';
// // import 'package:brayne_digital_app/common_widgets/custom_button.dart';
// // import 'package:brayne_digital_app/common_widgets/custom_textfeild.dart';
// // import 'package:brayne_digital_app/features/advertiser/advertiser_auth/advertiser_login_screen/widget/secial_media_card.dart';
// // import 'package:brayne_digital_app/helpers/all_routes.dart';
// // import 'package:brayne_digital_app/helpers/navigation_service.dart';
// // import 'package:brayne_digital_app/helpers/ui_helpers.dart';
// // import 'package:brayne_digital_app/helpers/toast.dart';
// // import 'package:brayne_digital_app/networks/api_acess.dart';
// // import 'package:flutter/gestures.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// //
// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({super.key});
// //
// //   @override
// //   State<LoginScreen> createState() => _LoginScreenState();
// // }
// //
// // class _LoginScreenState extends State<LoginScreen> {
// //
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //
// //   bool _isLoading = false;
// //
// //   Future<void> _submitForm() async {
// //     if (!_formKey.currentState!.validate()) return;
// //
// //     setState(() => _isLoading = true);
// //
// //     bool success = await signInRx.signIn(
// //       email: emailController.text,
// //       password: passwordController.text,
// //     );
// //
// //     setState(() => _isLoading = false);
// //
// //     if (success) {
// //       ToastUtil.showLongToast("Login successful");
// //         NavigationService.navigateTo(Routes.advertiserResetPasswordScreen);
// //     //  NavigationService.navigateTo(Routes.advertiserBottomNavScreen);
// //     } else {
// //       ToastUtil.showLongToast("Login failed");
// //     }
// //   }
// //
// //   void _guestLogin() {
// //     NavigationService.navigateTo(Routes.advertiserBottomNavScreen);
// //   }
// //
// //   String? _validateEmail(String? value) {
// //     if (value == null || value.trim().isEmpty) return 'Please enter your email';
// //     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
// //       return 'Enter a valid email';
// //     }
// //     return null;
// //   }
// //
// //   String? _validatePassword(String? value) {
// //     if (value == null || value.isEmpty) return 'Please enter your password';
// //     if (value.length < 6) return 'Password must be at least 6 characters';
// //     return null;
// //   }
// //
// //   @override
// //   void dispose() {
// //     emailController.dispose();
// //     passwordController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       resizeToAvoidBottomInset: true,
// //       backgroundColor: AppColors.white,
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           padding: EdgeInsets.symmetric(horizontal: 24.w),
// //           child: Form(
// //             key: _formKey,
// //             child: Column(
// //               children: [
// //                 UIHelper.verticalSpace(40.h),
// //                 Text(
// //                   "Suki Discounts.",
// //                   textAlign: TextAlign.center,
// //                   style: TextFontStyle.titleStyle40w400WhiteMarcellusSc.copyWith(
// //                     color: AppColors.primary2,
// //                   ),
// //                 ),
// //                 UIHelper.verticalSpace(20.h),
// //                 Text(
// //                   "Welcome back! Glad to see \nyou, Again!",
// //                   textAlign: TextAlign.center,
// //                   style: TextFontStyle.titleStyle24w600primary2Manrope.copyWith(
// //                     color: AppColors.c181818,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 UIHelper.verticalSpace(24.h),
// //
// //                 /// Email
// //                 _buildLabel("Email"),
// //                 CustomTextfield(
// //                   controller: emailController,
// //                   hintText: "Enter your email",
// //                   isObsecure: false,
// //                   validator: _validateEmail,
// //                   borderColor: AppColors.cE8E8E8,
// //                   fillColor: AppColors.white,
// //                   prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
// //                 ),
// //                 UIHelper.verticalSpace(12.h),
// //
// //                 /// Password
// //                 _buildLabel("Password"),
// //                 CustomTextfield(
// //                   controller: passwordController,
// //                   hintText: "Enter your password",
// //                   isObsecure: true,
// //                   isPass: true,
// //                   validator: _validatePassword,
// //                   borderColor: AppColors.cE8E8E8,
// //                   fillColor: AppColors.white,
// //                   prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
// //                 ),
// //
// //                 UIHelper.verticalSpace(8.h),
// //                 Align(
// //                   alignment: Alignment.centerRight,
// //                   child: GestureDetector(
// //                     onTap: () {
// //                       NavigationService.navigateTo(Routes.advertiserForgetPasswordScreen);
// //                     },
// //                     child: Text(
// //                       "Forgot Password?",
// //                       style: TextFontStyle.titleStyle14w400grey888E9CManrope.copyWith(
// //                         color: AppColors.c757575,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //
// //                 UIHelper.verticalSpace(32.h),
// //
// //                 /// Login button
// //                 _isLoading
// //                     ? const CircularProgressIndicator()
// //                     : CustomButton(
// //                   name: "Log in",
// //                   onCallBack: _submitForm,
// //                   context: context,
// //                   color: AppColors.primary2,
// //                   height: 56.h,
// //                   borderRadius: 8.r,
// //                   textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
// //                 ),
// //
// //                 UIHelper.verticalSpace(16.h),
// //
// //                 /// Guest login
// //                 CustomButton(
// //                   name: "Login as Guest",
// //                   onCallBack: _guestLogin,
// //                   context: context,
// //                   color: AppColors.cFFFFFF,
// //                   height: 56.h,
// //                   borderRadius: 8.r,
// //                   textStyle: TextFontStyle.titleStyle14w500WhiteManrope.copyWith(
// //                     color: AppColors.primary2,
// //                   ),
// //                 ),
// //
// //                 UIHelper.verticalSpace(16.h),
// //
// //                 /// Divider
// //                 Row(
// //                   children: [
// //                     Expanded(child: Divider(color: Colors.grey.withOpacity(.7))),
// //                     Padding(
// //                       padding: EdgeInsets.symmetric(horizontal: 16.w),
// //                       child: Text("Or Login with", style: TextFontStyle.titleStyle14w400grey888E9CManrope),
// //                     ),
// //                     Expanded(child: Divider(color: Colors.grey.withOpacity(.7))),
// //                   ],
// //                 ),
// //
// //                 UIHelper.verticalSpace(24.h),
// //
// //                 /// Social login buttons
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     AdvertiserSocialLoginButton(
// //                       icon: SvgPicture.asset(AppIcons.google),
// //                       onPressed: () {
// //                         // Google login logic
// //                       },
// //                     ),
// //                     UIHelper.horizontalSpace(24.w),
// //                     AdvertiserSocialLoginButton(
// //                       icon: SvgPicture.asset(AppIcons.apple),
// //                       onPressed: () {
// //                         // Apple login logic
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //
// //                 UIHelper.verticalSpace(20.h),
// //
// //                 /// Register
// //                 Text.rich(
// //                   TextSpan(
// //                     text: "Don't have an account? ",
// //                     style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
// //                       color: AppColors.c2F2F2F,
// //                       fontWeight: FontWeight.w400,
// //                     ),
// //                     children: [
// //                       TextSpan(
// //                         text: "Register Now",
// //                         style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
// //                           color: AppColors.primary2,
// //                         ),
// //                         recognizer: TapGestureRecognizer()
// //                           ..onTap = () => NavigationService.navigateTo(Routes.advertiserSignupScreen),
// //                       ),
// //                     ],
// //                   ),
// //                   textAlign: TextAlign.center,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildLabel(String text) {
// //     return Align(
// //       alignment: Alignment.centerLeft,
// //       child: Text(
// //         text,
// //         style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
// //           color: AppColors.c2F2F2F,
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
//
//
// // Loading ////////////////////////////
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// import 'package:brayne_digital_app/assets_helper/app_colors.dart';
// import 'package:brayne_digital_app/assets_helper/app_fonts.dart';
// import 'package:brayne_digital_app/assets_helper/app_icons.dart';
// import 'package:brayne_digital_app/common_widgets/custom_button.dart';
// import 'package:brayne_digital_app/common_widgets/custom_textfeild.dart';
// import 'package:brayne_digital_app/features/advertiser/advertiser_auth/advertiser_login_screen/widget/secial_media_card.dart';
// import 'package:brayne_digital_app/helpers/all_routes.dart';
// import 'package:brayne_digital_app/helpers/navigation_service.dart';
// import 'package:brayne_digital_app/helpers/ui_helpers.dart';
// import 'package:brayne_digital_app/helpers/toast.dart';
// import 'package:brayne_digital_app/networks/api_acess.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   Future<void> _submitForm() async {
//     if (!_formKey.currentState!.validate()) return;
//
//     // API Call Without Loading
//     bool success = await signInRx.signIn(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     );
//
//     if (success) {
//       ToastUtil.showLongToast("Login successful");
//       NavigationService.navigateTo(Routes.advertiserResetPasswordScreen);
//       // NavigationService.navigateTo(Routes.advertiserBottomNavScreen);
//     } else {
//       ToastUtil.showLongToast("Login failed");
//     }
//   }
//
//   void _guestLogin() {
//     NavigationService.navigateTo(Routes.advertiserBottomNavScreen);
//   }
//
//   String? _validateEmail(String? value) {
//     if (value == null || value.trim().isEmpty) return 'Please enter your email';
//     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//       return 'Enter a valid email';
//     }
//     return null;
//   }
//
//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) return 'Please enter your password';
//     if (value.length < 6) return 'Password must be at least 6 characters';
//     return null;
//   }
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: AppColors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 24.w),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 UIHelper.verticalSpace(40.h),
//
//                 /// Title
//                 Text(
//                   "Suki Discounts.",
//                   textAlign: TextAlign.center,
//                   style: TextFontStyle.titleStyle40w400WhiteMarcellusSc.copyWith(
//                     color: AppColors.primary2,
//                   ),
//                 ),
//                 UIHelper.verticalSpace(20.h),
//
//                 /// Subtitle
//                 Text(
//                   "Welcome back! Glad to see \nyou, Again!",
//                   textAlign: TextAlign.center,
//                   style: TextFontStyle.titleStyle24w600primary2Manrope.copyWith(
//                     color: AppColors.c181818,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 UIHelper.verticalSpace(24.h),
//
//                 /// Email
//                 _buildLabel("Email"),
//                 CustomTextfield(
//                   controller: emailController,
//                   hintText: "Enter your email",
//                   isObsecure: false,
//                   validator: _validateEmail,
//                   borderColor: AppColors.cE8E8E8,
//                   fillColor: AppColors.white,
//                   prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
//                 ),
//                 UIHelper.verticalSpace(12.h),
//
//                 /// Password
//                 _buildLabel("Password"),
//                 CustomTextfield(
//                   controller: passwordController,
//                   hintText: "Enter your password",
//                   isObsecure: true,
//                   isPass: true,
//                   validator: _validatePassword,
//                   borderColor: AppColors.cE8E8E8,
//                   fillColor: AppColors.white,
//                   prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
//                 ),
//
//                 UIHelper.verticalSpace(8.h),
//
//                 /// Forgot password
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: GestureDetector(
//                     onTap: () {
//                       NavigationService.navigateTo(Routes.advertiserForgetPasswordScreen);
//                     },
//                     child: Text(
//                       "Forgot Password?",
//                       style: TextFontStyle.titleStyle14w400grey888E9CManrope.copyWith(
//                         color: AppColors.c757575,
//                       ),
//                     ),
//                   ),
//                 ),
//                 UIHelper.verticalSpace(32.h),
//
//                 /// Login Button
//                 CustomButton(
//                   name: "Log in",
//                   onCallBack: _submitForm,
//                   context: context,
//                   color: AppColors.primary2,
//                   height: 56.h,
//                   borderRadius: 8.r,
//                   textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
//                 ),
//                 UIHelper.verticalSpace(16.h),
//
//                 /// Guest login
//                 CustomButton(
//                   name: "Login as Guest",
//                   onCallBack: _guestLogin,
//                   context: context,
//                   color: AppColors.cFFFFFF,
//                   height: 56.h,
//                   borderRadius: 8.r,
//                   textStyle: TextFontStyle.titleStyle14w500WhiteManrope.copyWith(
//                     color: AppColors.primary2,
//                   ),
//                 ),
//                 UIHelper.verticalSpace(16.h),
//
//                 /// Divider
//                 Row(
//                   children: [
//                     Expanded(child: Divider(color: Colors.grey.withOpacity(.7))),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.w),
//                       child: Text("Or Login with", style: TextFontStyle.titleStyle14w400grey888E9CManrope),
//                     ),
//                     Expanded(child: Divider(color: Colors.grey.withOpacity(.7))),
//                   ],
//                 ),
//                 UIHelper.verticalSpace(24.h),
//
//                 /// Social buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     AdvertiserSocialLoginButton(
//                       icon: SvgPicture.asset(AppIcons.google),
//                       onPressed: () {},
//                     ),
//                     UIHelper.horizontalSpace(24.w),
//                     AdvertiserSocialLoginButton(
//                       icon: SvgPicture.asset(AppIcons.apple),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//                 UIHelper.verticalSpace(20.h),
//
//                 /// Register Text
//                 Text.rich(
//                   TextSpan(
//                     text: "Don't have an account? ",
//                     style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
//                       color: AppColors.c2F2F2F,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: "Register Now",
//                         style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
//                           color: AppColors.primary2,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () => NavigationService.navigateTo(Routes.advertiserSignupScreen),
//                       ),
//                     ],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLabel(String text) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         text,
//         style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
//           color: AppColors.c2F2F2F,
//         ),
//       ),
//     );
//   }
// }
//
//
