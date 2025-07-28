
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/features/merchant/merchant_add_offer/validity_and_timing/widget/step_bar_widget.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {



  final TextEditingController businessCategoryController = TextEditingController();
  final TextEditingController basicInfoController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  bool _showDropdown = false;
  final List<String> _items = ['0', '1', '2', '3',];


  int currentStep = 0;

  final List<String> stepTitles = [
    "Basic Info",
    "Validity & Timing",
    "Redemption Rules",
    "Optional Settings",
  ];

  @override
  void dispose() {
    basicInfoController. dispose();
    descriptionController. dispose();
    businessCategoryController. dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:AppColors.cFFFFFF,
      appBar: CustomAppbarProfile(title: "Basic Info", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.h,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             UIHelper.verticalSpace(20.h),
            LayoutBuilder(
              builder: (context, constraints) {
                double totalWidth = constraints.maxWidth;
                double stepWidth = totalWidth / stepTitles.length;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 16,
                      left: stepWidth / 2,
                      right: stepWidth / 2,
                      child: Container(
                        height: 2,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(stepTitles.length, (index) {
                        return StepItem(
                          index: index,
                          currentStep: currentStep,
                          title: stepTitles[index],
                          onTap: (stepIndex) {

                            setState(() {
                              currentStep = stepIndex;
                            });
                          },
                        );
                      }),
                    ),
                  ],
                );
              },
            ),
            UIHelper.verticalSpace(24.h),

//---------------------------------------- basInfo ----------------------------------------------//
            Text('Basic Info',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
            UIHelper.verticalSpace(24.h),
            CustomTextfield(
              controller: basicInfoController,
              borderRadius:8.r,
              fillColor: AppColors.cFFFFFF,
              borderColor:  AppColors.cE8E8E8,
              hintText: 'e.g., Buy 1 Get 1 Free on All Burgers',
            ),

            UIHelper.verticalSpace(24.h),
///----------------------------------------- Done ------------------------------------------------///
 //--------------------------------------------- descriptionController --------------------------------//



            Text('Description',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
            CustomTextfield(
              controller: descriptionController,
              maxline: 4,
              fillColor: AppColors.cFFFFFF,
              borderColor: AppColors.cE8E8E8,
              hintText: 'Available on weekdays between 2-5 PM. Dine-in only.',
            ),

            UIHelper.verticalSpace(24.h),
 //---------------------------------------- Done -----------------------------------------------//


  //--------------------------------------- businessCategoryController -------------------------------//

            Text('Business Category',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
            UIHelper.verticalSpace(8.h),


            CustomTextfield(
              borderRadius: 8.r,
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
                    AppIcons.leftIcon,
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
                        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
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
            Text('Location (s)',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
            UIHelper.verticalSpace(8.h),

            CustomTextfield(
              prefixIcon: Transform.scale(
                  scale: 0.30,
                  child: SvgPicture.asset(AppIcons.location,height: 12.h)),
              fillColor: AppColors.cFFFFFF,
              borderColor: AppColors.cE8E8E8,
              hintText: 'Add Location',
            ),



          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16.h),
          child: CustomButton(
            name: "Next",
            context: context,
            color: AppColors.primary2,
            height: 56.h,
            borderRadius: 8.r,
            textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
            onCallBack: () {
              NavigationService.navigateTo(Routes.validityAndTimingScreen);
            },
          ),
        ),
      ),
    );
  }
}
