
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/features/merchant/merchant_auth/merchant_information_screen/widget/day_card.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MerchantInformationScreen extends StatefulWidget {
  final Function(bool) onChanged; // Callback function

  const MerchantInformationScreen({super.key, required this.onChanged});

  @override
  State<MerchantInformationScreen> createState() =>
      _MerchantInformationScreenState();
}

class _MerchantInformationScreenState extends State<MerchantInformationScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userStoreController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  bool _isChecked = false;

  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSwitched = false;
  bool _showDropdown = false;
  final List<String> _items = ['1', '2', '3', '4', '5'];

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

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbarProfile(title: "Login to manage your store.", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,textSize: 15,),

      backgroundColor: AppColors.white,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
              ),
              child: Column(
                children: [
                  UIHelper.verticalSpace(10.h),
                  
                  ///===============Business Name TextField==================///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Store Name",
                        style: TextFontStyle.titleStyle16w500primary2Manrope
                            .copyWith(
                          color: AppColors.c2F2F2F,
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(8.h),
                  
                  ///==============Store Section===================//
                  CustomTextfield(
                    borderRadius: 8.r,
                    borderColor: AppColors.cE8E8E8,
                    fillColor: AppColors.white,
                    controller: userNameController,
                    hintText: "Enter store name",
                    validator: _validateUserName,
                    prefixIcon: const Icon(Icons.store, color: Colors.grey),
                  ),
                  
                  UIHelper.verticalSpace(16.h),
                  
                  ///===============Category Section===============//
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Business Category',
                          style: TextFontStyle.titleStyle14w500c2F2F2FManrope
                              .copyWith(fontSize: 16.sp)),
                    ],
                  ),
                  
                  UIHelper.verticalSpace(8.h),
                  
                  CustomTextfield(
                    borderRadius: 8.r,
                    isRead: true,
                    controller: categoryController,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showDropdown = !_showDropdown;
                        });
                      },
                      child: Transform.scale(
                        scale: 0.30,
                        child: SvgPicture.asset(
                          AppIcons.dropDownArrow,
                          height: 12.h,
                        ),
                      ),
                    ),
                    fillColor: AppColors.cFFFFFF,
                    borderColor: AppColors.cE8E8E8,
                    hintText: 'Select Category',
                  ),
                  
                  if (_showDropdown)
                    Container(
                      width: 125.w,
                      margin: EdgeInsets.only(top: 2.h, left: 16.w),
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        border: Border.all(color: AppColors.cE8E8E8),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: _items.map((item) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                categoryController.text = item;
                                _showDropdown = false;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 8.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  
                  UIHelper.verticalSpace(24.h),
                  
                  ///===============Store Address TextField==================///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Store address",
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
                    controller: userStoreController,
                    hintText: "Enter store address",
                    validator: _validateUserName,
                    prefixIcon: const Icon(Icons.store, color: Colors.grey),
                  ),
                  
                  UIHelper.verticalSpace(16.h),
                  
                  ///=============location=====================
                  CustomButton(
                      iconPrefix: Icon(
                        Icons.location_on_outlined,
                        color: AppColors.primary2,
                      ),
                      color: AppColors.white,
                      borderRadius: 8.r,
                      borderColor: AppColors.primary2,
                      name: "Use Current Location",
                      textStyle: TextStyle(color: AppColors.primary),
                      onCallBack: () {},
                      context: context),
                  
                  UIHelper.verticalSpace(40.h),
                  
                  ///=============location=====================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomButton(
                          iconPrefix: Icon(Icons.access_time_outlined,
                              color: AppColors.primary2),
                          color: AppColors.white,
                          borderRadius: 12.r,
                          borderColor: AppColors.primary2,
                          name: "Opening Time",
                          textStyle: TextStyle(color: AppColors.primary),
                          onCallBack: () {},
                          context: context,
                        ),
                      ),
                      UIHelper.horizontalSpace(16.w),
                      Expanded(
                        child: CustomButton(
                          iconPrefix: Icon(Icons.access_time_outlined,
                              color: AppColors.primary2),
                          color: AppColors.white,
                          borderRadius: 12.r,
                          borderColor: AppColors.primary2,
                          name: "Closing Time",
                          textStyle: TextStyle(color: AppColors.primary),
                          onCallBack: () {},
                          context: context,
                        ),
                      ),
                    ],
                  ),
                  
                  UIHelper.verticalSpace(12.h),
                  
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: CupertinoSwitch(
                          inactiveThumbColor: AppColors.cFFFFFF,
                          thumbColor: AppColors.cFFFFFF,
                          value: isSwitched,
                          activeColor: AppColors.cD1D1D1,
                          trackColor: AppColors.cFF4800,
                          onChanged: (bool value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Open 24/7',
                        style:
                            TextFontStyle.titleStyle16w600c181818Manrope.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c2F2F2F,
                        ),
                      ),
                    ],
                  ),
                  
                  UIHelper.verticalSpace(16.h),
                  
                  SizedBox(
                    height: 48.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: days.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return DayCard(day: days[index]);
                      },
                    ),
                  ),
                  
                  UIHelper.verticalSpace(16.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isChecked = newValue ?? false;
                          });
                          widget.onChanged(_isChecked); // Trigger callback
                        },
                        shape: const CircleBorder(),
                        activeColor: AppColors.primary2,
                        checkColor: AppColors.white,
                        side: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "I agree to the term ",
                              style: TextFontStyle.titleStyle16w500primary2Manrope
                                  .copyWith(color: AppColors.c000000),
                            ),
                            TextSpan(
                              text: "& Conditions",
                              style: TextFontStyle.titleStyle16w500primary2Manrope
                                  .copyWith(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  UIHelper.verticalSpace(20.h),
                  
                  CustomButton(
                      color: AppColors.primary2,
                      name: "Save",
                      onCallBack: () {
                        NavigationService.navigateTo(
                            Routes.merchantBottomNavScreen);
                      },
                      context: context),
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

// Reusable social login button widget
