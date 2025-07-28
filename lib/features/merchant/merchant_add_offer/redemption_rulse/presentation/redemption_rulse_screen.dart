
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/features/merchant/merchant_add_offer/redemption_rulse/widget/doted_widget.dart';
import 'package:digital_app/features/merchant/merchant_add_offer/redemption_rulse/widget/redemption_widget.dart';
import 'package:digital_app/features/merchant/merchant_add_offer/validity_and_timing/widget/step_bar_widget.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class RedemptionRulseScreen extends StatefulWidget {
  const RedemptionRulseScreen({super.key});

  @override
  State<RedemptionRulseScreen> createState() => _RedemptionRulseScreenState();
}

class _RedemptionRulseScreenState extends State<RedemptionRulseScreen> {
  int currentStep = 2;

  final List<String> stepTitles = [
    "Basic Info",
    "Validity & Timing",
    "Redemption Rules",
    "Optional Settings",
  ];

  final List<String> circleIcon = [
    "assets/icons/circleicon (2).svg",
    "assets/icons/circleicon (2).svg",
    "assets/icons/circleicon (2).svg",
  ];

  final List<String> percentIcon = [
    "assets/icons/percentIcon.svg",
    "assets/icons/percentIcon.svg",
    "assets/icons/percentIcon.svg",
  ];

  final List<String> title = [
    "Percentage Off",
    "Fixed Amount",
    "Free Item",
  ];

  final List<String> subtitle = [
    "e.g., 20% off total bill",
    "e.g., \$10 off",
    "e.g., Free drink with any meal",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppbarProfile(title: "Redemption Rules", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
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
            UIHelper.verticalSpace(32.h),
            Text(
              'Discount Type',
              style: TextFontStyle.titleStyle14w500c2F2F2FManrope
                  .copyWith(fontSize: 16.sp),
            ),
            UIHelper.verticalSpace(8.h),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: title.length,
              separatorBuilder: (context, index) => UIHelper.verticalSpace(8.h),
              itemBuilder: (context, index) {
                return DiscountWidget(
                  percentIcon: SvgPicture.asset(percentIcon[index]),
                  circleIcon: SvgPicture.asset(circleIcon[index]),
                  title: 'Percentage Off',
                  subtitle: 'e.g., 20% off total bill',
                );
              },
            ),
            UIHelper.verticalSpace(24.h),
            Text(
              'Redemption Limit',
              style: TextFontStyle.titleStyle14w500c2F2F2FManrope
                  .copyWith(fontSize: 16.sp),
            ),
            UIHelper.verticalSpace(8.h),

            Row(
              children: [
                Container(
                  padding:  EdgeInsets.symmetric(vertical: 13.h,horizontal: 16.w),
                   width: 70.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.cE8E8E8,width: 1.w)
                  ),
                  child: Text('0'),
                ),
                UIHelper.horizontalSpace(12.w),
                Text('Per customer',style: TextFontStyle.titleStyle14w600c757575Manrope,)
              ],
            ),

            UIHelper.verticalSpace(24.h),
            Text(
              'Visual Assets',
              style: TextFontStyle.titleStyle14w500c2F2F2FManrope
                  .copyWith(fontSize: 16.sp),
            ),
            UIHelper.verticalSpace(8.h),


            DottedCustomWidget(
                text: 'Upload Offer Image',
                textmb: '(Recommended size: 1200x630px)',
                icon: SvgPicture.asset(
                  AppIcons.gallryIcon,

                )),
            UIHelper.verticalSpace(24.h),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,),
          child: CustomButton(
            name: "Next",
            context: context,
           color: AppColors.primary2,
            height: 56.h,
            borderRadius: 8.r,
            textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
            onCallBack: () {
              NavigationService.navigateTo(Routes.optionalSettingScreen);
            },
          ),
        ),
      ),
    );
  }
}
