
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

class AdvertiserTitleScreen extends StatefulWidget {
  const AdvertiserTitleScreen({super.key});

  @override
  State<AdvertiserTitleScreen> createState() => _AdvertiserTitleScreenState();
}

class _AdvertiserTitleScreenState extends State<AdvertiserTitleScreen> {


//----------------------------- Droup Dwon -----------------------------------------//

  final List<String> _items = ['1', '2', '3', '4', '5'];
  bool _showDropdown = false;
//----------------------------- Done -----------------------------------------//


//----------------------------------- addtitle ---------------------------------------------------//

  final TextEditingController addTitleController = TextEditingController();
  final TextEditingController  descriptionController = TextEditingController();
  final TextEditingController  categoryController = TextEditingController();
  final TextEditingController   calltoactionController = TextEditingController();
//--------------------------------------------------- Done --------------------------------------------------------//

//------------------------------------------------ Calander -----------------------------------------------------//

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

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
//------------------------------------------------------ Done ---------------------------------------------------------//

  @override
  void dispose() {
    addTitleController. dispose();
    descriptionController. dispose();
    categoryController. dispose();
    calltoactionController. dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppbarProfile(title: "Create New Ad.", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(' Ad Title',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),

            UIHelper.verticalSpace(8.h),
//------------------------------------- Textformfield addTitle  -----------------------------------------------------//
            CustomTextfield(
            controller: addTitleController,
              borderRadius: 8.r,
              fillColor: AppColors.cFFFFFF,
              borderColor: AppColors.cE8E8E8,
              hintText: 'Summer sale-30% off',
            ),

            UIHelper.verticalSpace(24.h),
            Text(' Description',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
            UIHelper.verticalSpace(8.h),


///--------------------------------- Done --------------------------------------------------------------//

//---------------------------------   Textformfield  description --------------------------------------------------------------//


            CustomTextfield(
              maxline: 4,
              controller: descriptionController,
              borderRadius: 8.r,
              fillColor: AppColors.cFFFFFF,
              borderColor: AppColors.cE8E8E8,
              hintText: 'Enter description',
            ),
            UIHelper.verticalSpace(24.h),
            Text('Category',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),

            UIHelper.verticalSpace(8.h),


//--------------------------------- Done --------------------------------------------------------------//


// ---------------------------------   Textformfield  category --------------------------------------------------------------//


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
///-----------------------------------------------  Done -----------------------------------------------//
            UIHelper.verticalSpace(24.h),


            Text(
              'Ad Duration',
              style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp),
            ),
            UIHelper.verticalSpace(8.h),
// ------------------------------------------- Calander --------------------------------------------//
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
            UIHelper.verticalSpace(24.h),

            Text(  ' Call to Action',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),

            UIHelper.verticalSpace(8.h),

//------------------------------------------ Done -----------------------------------------------//

//------------------------------------------ Textformfield  calltoaction -----------------------------------------------//

            CustomTextfield(
              controller:  calltoactionController,
              borderRadius: 8.r,
              fillColor: AppColors.cFFFFFF,
              borderColor: AppColors.cE8E8E8,
              hintText: 'Shop Now',
            ),


//----------------------------------------- Done -----------------------------------------------------------//
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
              NavigationService.navigateTo(Routes.advertiserAllVedioScreen);
            },
          ),
        ),
      ),
    );
  }
}
