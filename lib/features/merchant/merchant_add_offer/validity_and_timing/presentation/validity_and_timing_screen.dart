
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/features/merchant/merchant_add_offer/validity_and_timing/widget/custom_calander_timing.dart';
import 'package:digital_app/features/merchant/merchant_add_offer/validity_and_timing/widget/step_bar_widget.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ValidityAndTimingScreen extends StatefulWidget {
  const ValidityAndTimingScreen({super.key});

  @override
  State<ValidityAndTimingScreen> createState() =>
      _ValidityAndTimingScreenState();
}

class _ValidityAndTimingScreenState extends State<ValidityAndTimingScreen> {
  int currentStep = 1;
  final List<String> stepTitles = [
    "Basic Info",
    "Validity & Timing",
    "Redemption Rules",
    "Optional Settings",
  ];

  final TextEditingController locationController = TextEditingController();

  //------------------------------- Calandr -----------------------------------//

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

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
          _startDateController.text = formattedDate;
        } else {
          _endDateController.text = formattedDate;
        }
      });
    }
  }
  //----------------------------------- Done ----------------------------//


  @override
  void dispose() {
    locationController. dispose();
    _startDateController. dispose();
    _endDateController. dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,

      appBar: CustomAppbarProfile(
        title: "Validity & Timing",
        iconPath: AppIcons.backArrowIcon,
        onIconTap: () => NavigationService.goBack,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 24.h,
        ),
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
//---------------------------------- Calander ----------------------------------//
            UIHelper.verticalSpace(24.h),
            Row(
              children: [
                CustomCalanderTiming(
                  label: 'Start Date',
                  onTap: () => _selectDate(isStart: true),
                  controller: _startDateController,
                ),
                UIHelper.horizontalSpace(16.w),
                CustomCalanderTiming(
                  label: 'End Date',
                  onTap: () => _selectDate(isStart: false),
                  controller: _endDateController,
                ),
              ],
            ),

//---------------------------------- Done ------------------------------------//

            UIHelper.verticalSpace(24.h),
            Text('Location (s)',
                style: TextFontStyle.titleStyle14w500c2F2F2FManrope
                    .copyWith(fontSize: 16.sp)),
            UIHelper.verticalSpace(8.h),

            // *
            CustomTextfield(
              borderRadius: 8.r,
              prefixIcon: Transform.scale(
                  scale: 0.30,
                  child: SvgPicture.asset(AppIcons.timeIcon, height: 18.h)),
              fillColor: AppColors.cFFFFFF,
              borderColor: AppColors.cE8E8E8,
              hintText: 'Set Time Range',
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: CustomButton(
            name: "Next",
            context: context,
            color: AppColors.primary2,
            height: 56.h,
            borderRadius: 8.r,
            textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
            onCallBack: () {
              NavigationService.navigateTo(Routes.redemptionRulseScreen);
            },
          ),
        ),
      ),
    );
  }
}
