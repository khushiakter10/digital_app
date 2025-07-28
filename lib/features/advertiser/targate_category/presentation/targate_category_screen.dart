
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/features/advertiser/targate_category/widget/calander_widget.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TargateCategoryScreen extends StatefulWidget {
  const TargateCategoryScreen({super.key});

  @override
  State<TargateCategoryScreen> createState() => _TargateCategoryScreenState();
}

class _TargateCategoryScreenState extends State<TargateCategoryScreen> {
  final TextEditingController calltoActionController = TextEditingController();
  final TextEditingController targetCategoryController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  bool _showCallToActionDropdown = false;
  bool _showTargetCategoryDropdown = false;

  final List<String> _items = ['1', '2', '3', '4', '5'];

  Future<void> _selectDate({required bool isStart}) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        String formattedDate =
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
        if (isStart) {
          startDateController.text = formattedDate;
        } else {
          endDateController.text = formattedDate;
        }
      });
    }
  }

  @override
  void dispose() {
    calltoActionController.dispose();
    targetCategoryController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,

      appBar: CustomAppbarProfile(
        title: "Create New Ad.",
        iconPath: AppIcons.backArrowIcon,
        onIconTap: () => NavigationService.goBack,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
 //--------------------------------- Calaction -------------------------------------//
            Text(
              'Call to Action',
              style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp),
            ),
            UIHelper.verticalSpace(8.h),

            CustomTextfield(
              borderRadius: 8.r,
              isRead: true,
              controller: calltoActionController,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _showCallToActionDropdown = !_showCallToActionDropdown;
                    _showTargetCategoryDropdown = false;
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
              hintText: 'Shop Now',
            ),
            if (_showCallToActionDropdown)
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 2.h),
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
                          calltoActionController.text = item;
                          _showCallToActionDropdown = false;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(item, style: TextStyle(fontSize: 10.sp)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
//--------------------------------- Done ----------------------------------------//

// --------------------------------- Target Category ----------------------------------------//

            UIHelper.verticalSpace(24.h),
            Text(
              'Target Category',
              style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp),
            ),
            UIHelper.verticalSpace(8.h),
            CustomTextfield(
              borderRadius: 8.r,
              isRead: true,
              controller: targetCategoryController,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _showTargetCategoryDropdown = !_showTargetCategoryDropdown;
                    _showCallToActionDropdown = false;
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
              hintText: 'Food',
            ),
            if (_showTargetCategoryDropdown)
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 2.h),
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
                          targetCategoryController.text = item;
                          _showTargetCategoryDropdown = false;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(item, style: TextStyle(fontSize: 10.sp)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

//--------------------------------------------- Done --------------------------------------//

//--------------------------------------------- Calander --------------------------------------//

            UIHelper.verticalSpace(24.h),
            Row(
              children: [
                CalanderWidget(
                  label: 'Start Date',
                  onTap: () => _selectDate(isStart: true),
                  controller: startDateController,
                ),
                UIHelper.horizontalSpace(16.w),
                CalanderWidget(
                  label: 'End Date',
                  onTap: () => _selectDate(isStart: false),
                  controller: endDateController,
                ),
              ],
            ),
  //----------------------------------- Done ---------------------------------//

          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 55.h),
          child: CustomButton(
            name: "Publish Advertise",
            context: context,
            color: AppColors.primary2,
            height: 56.h,
            borderRadius: 8.r,
            textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
            onCallBack: () {
              NavigationService.navigateTo(Routes.videoSourceScreen);
            },
          ),
        ),
      ),
    );
  }
}
