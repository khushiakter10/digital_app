
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/features/merchant/merchant_add_offer/validity_and_timing/widget/step_bar_widget.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionalSettingScreen extends StatefulWidget {
  const OptionalSettingScreen({super.key});

  @override
  State<OptionalSettingScreen> createState() => _OptionalSettingScreenState();
}

class _OptionalSettingScreenState extends State<OptionalSettingScreen> {


  final TextEditingController termsConditionsController = TextEditingController();
  final TextEditingController offerCodeTagController = TextEditingController();


  bool isSwitched = false;

  int currentStep = 3;
  final List<String> stepTitles = [
    "Basic Info",
    "Validity & Timing",
    "Redemption Rules",
    "Optional Settings",
  ];



  @override
  void dispose() {
    termsConditionsController. dispose();
    offerCodeTagController. dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor:AppColors.cFFFFFF,
      appBar: CustomAppbarProfile(title: "Optional Setting", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,),

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
              Text('Optional Settings',style: TextFontStyle.titleStyle16w600c181818Manrope.copyWith(fontSize: 20.sp)),
              UIHelper.verticalSpace(24.h),
              Text('Terms & Conditions',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
              UIHelper.verticalSpace(8.h),
//------------------------------------- termsConditionsController -----------------------------//
              CustomTextfield(
                controller: termsConditionsController,
                maxline: 4,
                fillColor: AppColors.cFFFFFF,
                borderColor:  AppColors.cE8E8E8,
                hintText: 'Add terms and conditions for your offer....',
              ),
              UIHelper.verticalSpace(24.h),
//----------------------------------- Done ------------------------------------------//

              Text('Offer Code/ Tag',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
              UIHelper.verticalSpace(8.h),


              CustomTextfield(
                controller: offerCodeTagController,
                borderRadius: 8.r,
                fillColor: AppColors.cFFFFFF,
                borderColor: AppColors.cE8E8E8,
                hintText: 'Enter tracking code',
              ),

              UIHelper.verticalSpace(24.h),

             Row(
               children: [
                 Text('Subscription Required',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
                 Spacer(),
                 Transform.scale(
                   scale: 0.7,
                   child: CupertinoSwitch(

                  inactiveThumbColor: AppColors.cFFFFFF,
                  thumbColor: AppColors.cFFFFFF,
                     value: isSwitched,
                     activeColor:  AppColors.cD1D1D1,
                     trackColor:  AppColors.cFF4800,
                     onChanged: (bool value) {
                       setState(() {
                         isSwitched = value;
                       });
                     },
                   ),
                 ),
               ],
             ),

            ],
          ),
        ),
        bottomNavigationBar:SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: CustomButton(
            name: "Next",
            context: context,
            color: AppColors.primary2,
            height: 56.h,
            borderRadius: 8.r,
            textStyle: TextFontStyle.titleStyle14w500WhiteManrope, onCallBack: () {},
          ),
        ),
      ),




    );
  }
}
