
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



class AdvertiserUpdatePasswordScreen extends StatefulWidget {
  const AdvertiserUpdatePasswordScreen({super.key});

  @override
  State<AdvertiserUpdatePasswordScreen> createState() => _AdvertiserUpdatePasswordScreenState();
}

class _AdvertiserUpdatePasswordScreenState extends State<AdvertiserUpdatePasswordScreen> {

  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  //------------------------------------------------ Validation  faction ---------------------------------------//
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }



  Future<void> _advertiserUpdate() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    try {


      UserUpdatePasswordDialogBox(context:  context,callback:  () {
        NavigationService.navigateToWithArgs(Routes.advertiserBottomNavScreen,{
          "email": emailController.text
        });
      },title:  "Update Success!",subTitle:  "Your password has been updated \nsuccessfully.",buttonTitle:  "Verify");




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
        title: "Update Password",
        iconPath: AppIcons.backArrowIcon,
        onIconTap: () => NavigationService.goBack,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Column(
              children: [

//------------------------------------------- Current TextFormfield -----------------------------------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(" Current Password",   style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),

                  ],
                ),

                UIHelper.verticalSpace(8.h),

                CustomTextfield(
                  borderColor: AppColors.cE8E8E8,
                  fillColor: AppColors.cFFFFFF,
                  hintText: 'Password',
                  controller: currentPasswordController,
                  isObsecure: true,
                  isPass: true,
                  validator: _validatePassword,
                ),
                UIHelper.verticalSpace(16.h),

 //------------------------------------------------- Done -------------------------------------------------//

 //------------------------------------------------- New Password  -------------------------------------------------//

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("New Password",   style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
                  ],
                ),

                UIHelper.verticalSpace(8.h),

                CustomTextfield(
                  borderRadius: 16.r,
                  borderColor: AppColors.cE8E8E8,
                  fillColor: AppColors.cFFFFFF,
                  hintText: 'Password',
                  controller: newPasswordController,
                  isObsecure: true,
                  isPass: true,
                  validator: _validatePassword,
                ),
                UIHelper.verticalSpace(16.h),

 //------------------------------------- Done --------------------------------------------------------//

 //------------------------------------- Confirm New Password --------------------------------------------------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Confirm New Password",   style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
                  ],
                ),

                UIHelper.verticalSpace(8.h),

                CustomTextfield(
                  borderRadius: 16.r,
                  borderColor: AppColors.cE8E8E8,
                  fillColor: AppColors.cFFFFFF,
                  hintText: 'Password',
                  controller: confirmNewPasswordController,
                  isObsecure: true,
                  isPass: true,
                  validator: _validatePassword,

                ),
//----------------------------------------------- Done -------------------------------------------------//

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 50.h,horizontal: 24.w),
          child: CustomButton(
            name: "Update Password",
            onCallBack: _advertiserUpdate,
            context: context,
            color: AppColors.primary2,
            height: 56.h,
            borderRadius: 8.r,
            textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
          ),
        ),
      ),
    );
  }
}