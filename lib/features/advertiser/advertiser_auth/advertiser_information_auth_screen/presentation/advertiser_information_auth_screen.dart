
import 'dart:io';
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';


class AdvertiserInformationAuthScreen extends StatefulWidget {
  const AdvertiserInformationAuthScreen({super.key});

  @override
  State<AdvertiserInformationAuthScreen> createState() =>
      _AdvertiserInformationAuthScreenState();
}

class _AdvertiserInformationAuthScreenState
    extends State<AdvertiserInformationAuthScreen> {

  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController businessCategoryController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _showDropdown = false;
  final List<String> _items = ['1', '2', '3', '4', '5'];

  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        setState(() {
          _image = File(picked.path);
        });
      }
    } catch (e) {
      debugPrint('Image pick error: $e');
    }
  }

  String? _validateUserName(String? value) {
    if (value == null || value.trim().isEmpty) return "Name is required";
    final RegExp nameRegExp = RegExp(r'^[A-Za-z]+(?: [A-Za-z]+)*$');
    if (!nameRegExp.hasMatch(value.trim())) {
      return "Only letters and single spaces allowed";
    }
    if (value.trim().length < 2) {
      return "Name must be at least 2 characters";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  void dispose() {
    businessNameController.dispose();
    businessCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric( horizontal: 16.w),
            child: Column(
              children: [
                UIHelper.verticalSpace(50.h),

                /// Title
                Text(
                  textAlign: TextAlign.center,
                  "Let’s Set Up Your Business \nProfile.",
                  style: TextFontStyle.titleStyle24w600primary2Manrope.copyWith(
                    color: AppColors.c181818,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                UIHelper.verticalSpace(24.h),

                /// Business Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Business Name",
                      style: TextFontStyle.titleStyle16w500primary2Manrope
                          .copyWith(color: AppColors.c2F2F2F),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(8.h),

                CustomTextfield(
                  borderRadius: 8.r,
                  borderColor: AppColors.cE8E8E8,
                  fillColor: AppColors.cFFFFFF,
                  controller: businessNameController,
                  hintText: "Enter your business name",
                  validator: _validateUserName,
                ),

                UIHelper.verticalSpace(16.h),

                /// Business Category
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
                  controller: businessCategoryController,
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
                              businessCategoryController.text = item;
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

                UIHelper.verticalSpace(16.h),

                /// Brand Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Brand Logo',
                        style: TextFontStyle.titleStyle14w500c2F2F2FManrope
                            .copyWith(fontSize: 16.sp)),
                  ],
                ),
                UIHelper.verticalSpace(16.h),

                /// Dotted Image Picker
                GestureDetector(
                  onTap: _pickImage,
                  child: DottedBorder(
                    borderType: BorderType.Circle,
                    color: const Color(0xFFE8E8E8),
                    strokeWidth: 2,
                    dashPattern: [6, 4],
                    child: Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: _image == null
                          ?  Center(
                        child: SvgPicture.asset(AppIcons.uploadLogo),
                      )
                          : ClipOval(
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                          width: 120.w,
                          height: 120.h,
                        ),
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(8.h),
                Text('Tap to upload logo',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp),)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: CustomButton(
            name: "Create Account",
            context: context,
            color: AppColors.primary2,
            height: 56.h,
            borderRadius: 8.r,
            textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
            onCallBack: () {
              NavigationService.navigateTo(Routes.advertiserSubcriptionScreen);
            },
          ),
        ),
      ),
    );
  }
}

