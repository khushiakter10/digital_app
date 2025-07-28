
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/features/merchant/merchant_offer/widget/active_widget.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MerchantOfferScreen extends StatefulWidget {
  const MerchantOfferScreen({super.key});

  @override
  State<MerchantOfferScreen> createState() => _MerchantOfferScreenState();
}

class _MerchantOfferScreenState extends State<MerchantOfferScreen> {
  final List<Map<String, dynamic>> categories = const [
    {'label': 'Active Offers 12'},
    {'label': 'Paused Offers 2'},
    {'label': 'Paused Offers 3'},
  ];
  bool isSelected = false;



  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF9FAFB,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbarProfile(title: "Offers Management", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack(),showIcon: false,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(

              children: [
                SizedBox(
                  height: 34.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0), // Uniform padding
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: ActiveWidget(
                            borderRadius: BorderRadius.circular(100.r),
                            label: category['label'],
                            isSelected: index == selectedIndex,
                            isDisabled: false,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                UIHelper.verticalSpace(24),

                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 24.h),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(29.36.r),
                            topRight: Radius.circular(29.36.r),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 188.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/food_image.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(29.36.r),
                                      topRight: Radius.circular(29.36.r),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 6.h),
                                        decoration: ShapeDecoration(
                                          color: AppColors.cFF4800,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(48.r),
                                          ),
                                        ),
                                        child: Text(
                                          '30% Off',
                                          style: TextFontStyle.titleStyle14w500cFFFFFFManrope.copyWith(fontSize: 18.sp),
                                        ),
                                      ),
                                      Spacer(),
                                      SvgPicture.asset(AppIcons.dotted),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '30% off lunch combos',
                                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                                  ),
                                  UIHelper.verticalSpace(8.h),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppIcons.percentIcon),
                                      UIHelper.horizontalSpace(8.w),
                                      Text(
                                        'Percentage discount',
                                        style: TextFontStyle.titleStyle14w400c757575Manrope.copyWith(fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                  UIHelper.verticalSpace(9.h),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppIcons.redCalander),
                                      UIHelper.horizontalSpace(8.w),
                                      Text(
                                        'May 15, 2025 - July 15, 2025',
                                        style: TextFontStyle.titleStyle14w400c757575Manrope.copyWith(fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                  UIHelper.verticalSpace(9.h),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppIcons.redmption),
                                      UIHelper.horizontalSpace(8.w),
                                      Text(
                                        '126 redemptions',
                                        style: TextFontStyle.titleStyle14w400c757575Manrope.copyWith(fontSize: 16.sp),
                                      ),
                                      Spacer(),

                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                                        decoration: ShapeDecoration(
                                          color: isSelected ? AppColors.cFF4800 : AppColors.c757575,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(32.r),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            isSelected ? 'Active' : 'Expired',
                                            style: TextFontStyle.titleStyle14w500cFFFFFFManrope,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                UIHelper.verticalSpace(80),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: AppColors.cFF4800,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon:  SvgPicture.asset(AppIcons.addicon),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,


    );
  }
}
