
import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class AdvertiserEditPersonalInfoScreen extends StatefulWidget {
  const AdvertiserEditPersonalInfoScreen({super.key});

  @override
  State<AdvertiserEditPersonalInfoScreen> createState() => _AdvertiserEditPersonalInfoScreenState();
}

class _AdvertiserEditPersonalInfoScreenState extends State<AdvertiserEditPersonalInfoScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  bool _isLoading = false;
  String selectedCountryCode = '+47';

  final Map<String, int> countryPhoneLengths = {
    '+47': 8,
    '+880': 10,
    '+1': 10,
    '+91': 10,
    '+44': 10,
  };

  @override
  void dispose() {
    userNameController.dispose();
    emailAddressController.dispose();
    numberController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _selectedImage = pickedFile;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
      );
    }
  }

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

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your number';
    }
    final int? requiredLength = countryPhoneLengths[selectedCountryCode];
    if (requiredLength != null && value.length != requiredLength) {
      return 'Enter a valid phone number with $requiredLength digits';
    }
    if (value.length < 6) {
      return 'Number must be at least 6 characters';
    }
    return null;
  }

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      NavigationService.navigateTo(Routes.merchantBottomNavScreen);

      // Navigate to a confirmation screen or back after successful update
      // Adjust navigation based on your app's flow
      // NavigationService.navigateToWithArgs(Routes.merchantSignupOtpVerificationScreen, {
      //   "email": emailController.text,
      // });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Update failed: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Widget phoneNumInputField(TextEditingController controller) {
    return SizedBox(
      height: 60.h,
      child: TextFormField(
        style: const TextStyle(color: AppColors.c333333),
        validator: _validateNumber,
        cursorColor: AppColors.c000000,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        showCursor: true,
        textInputAction: TextInputAction.done,
        controller: controller,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          fillColor: AppColors.cFFFFFF,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 12.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.cE8E8E8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.cE8E8E8),
          ),
          hintText: 'Enter phone number',
          hintStyle: const TextStyle(color: AppColors.grey888E9C),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.cE8E8E8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.cE8E8E8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.cE8E8E8),
          ),
          prefixIcon: CountryCodePicker(
            onChanged: (countryCode) {
              setState(() {
                selectedCountryCode = countryCode.dialCode!;
              });
            },
            initialSelection: 'NO',
            favorite: const ['+47', 'SE'],
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            showFlag: true,
            showFlagDialog: true,
            showDropDownButton: true,
            alignLeft: false,
            padding: EdgeInsets.all(1.sp),
            textStyle: const TextStyle(color: AppColors.c333333),
          ),
          errorStyle: TextFontStyle.titleStyle16w500primary2Manrope,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarProfile(title: "Edit Personal Info", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack, showIcon: true),
      backgroundColor: AppColors.cFFFFFF,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
//-------------------------------------------------- Profile -----------------------------------------------//

              UIHelper.verticalSpace(36.h),
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 47.r,
                      backgroundColor: AppColors.cFFF7F5,
                      child: _selectedImage == null
                          ? Image.asset(AppImages.profileImage2)
                          : ClipOval(
                        child: Image.file(
                          File(_selectedImage!.path),
                          width: 94.w,
                          height: 94.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Image.asset(AppImages.profileImage2),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -2.w,
                      bottom: -8.h,
                      child: GestureDetector(
                        onTap: () => _showPicker(context),
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: AppColors.primary2,
                          child: SvgPicture.asset(
                            AppIcons.camera2,
                            width: 18.w,
                            height: 18.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

//--------------------------------------------------- Full Name ------------------------------------------------//
              UIHelper.verticalSpace(24.h),
              Text("Full Name", style: TextFontStyle.titleStyle16w600c181818Manrope.copyWith(fontSize: 14.sp),
              ),
              UIHelper.verticalSpace(8.h),
              CustomTextfield(
                borderColor: AppColors.cE8E8E8,
                fillColor: AppColors.white,
                controller: userNameController,
                hintText: "Sarah Jhonson",
                validator: _validateUserName,
              //  prefixIcon: const Icon(Icons.account_circle_outlined, color: Colors.grey),
              ),
 //-------------------------------------- Done -------------------------------------------------------------//
 //------------------------------------------ Custom TextFormfield ----------------------------------------------//
              UIHelper.verticalSpace(16.h),

                Text("E-mail Address", style: TextFontStyle.titleStyle16w600c181818Manrope.copyWith(fontSize: 14.sp),),
              UIHelper.verticalSpace(8.h),
              CustomTextfield(
                borderColor: AppColors.cE8E8E8,
                fillColor: AppColors.white,
                hintText: 'Sarah@gmail.com',
                controller: emailAddressController,
                validator: _validateEmail,
               // prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
              ),

//------------------------------------------------------- Done -----------------------------------------------------//
 //------------------------------------------------------ Button -----------------------------------------------------//
              UIHelper.verticalSpace(16.h),
              Text("Contact Number",style: TextFontStyle.titleStyle16w600c181818Manrope.copyWith(fontSize: 14.sp)),
              UIHelper.verticalSpace(8.h),
              phoneNumInputField(numberController),
              UIHelper.verticalSpace(190.h),
              CustomButton(
                name: _isLoading ? "Updating..." : "Update",
                onCallBack: _updateProfile,
                context: context,
                color: AppColors.primary2,
                height: 56.h,
                borderRadius: 8.r,
                textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
              ),
              UIHelper.verticalSpace(15.h),
 //--------------------------------------------------- Done ---------------------------------------------------//
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}


