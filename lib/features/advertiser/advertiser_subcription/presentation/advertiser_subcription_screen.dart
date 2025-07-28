
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AdvertiserSubcriptionScreen extends StatelessWidget {
  const AdvertiserSubcriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.cFFFFFF,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            child: Column(
              children: [
                UIHelper.verticalSpace(8.h),

 //----------------------------------------- Appbar ---------------------------------------------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        NavigationService.goBack;
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 0,
                                color: AppColors.whiteF3F3F3,
                              ),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: SvgPicture.asset(AppIcons.backArrowIcon),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Text('Choose Your Plan',style: TextFontStyle.titleStyle20w700Whiteinter),
                          UIHelper.verticalSpace(4.h),

                          Text("Reach more customers and boost your ",  style: TextFontStyle .titleStyle14w500c757575Manrope,maxLines: 1,


                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                     NavigationService.navigateTo(Routes.advertiserBottomNavScreen);
                      },
                      child: Text('skip',
                          style: TextFontStyle.titleStyle14w500WhiteManrope
                              .copyWith(color: AppColors.primary2)),
                    ),
                  ],
                ),
//----------------------------------- Done -------------------------------------------------//

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        UIHelper.verticalSpace(12.h),

                        ///>>>>>>>>>>>>>>>>>>>>>>>> Basic Most Popular Subscription >>>>>>>>>>>>>>>>

                        Container(
                          padding:  EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color:  AppColors.cFF6B34,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            children: [
                              // Header Section
                              Container(
                                padding: const EdgeInsets.all(18),
                                height: 65.h,
                                decoration: BoxDecoration(
                                  color:  AppColors.cFF6B34,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16.r)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text("Starter",style: TextFontStyle.titleStyle24w600cFFFFFFManrope),


                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w, vertical: 6.h),
                                      decoration: BoxDecoration(
                                        color:  AppColors.cFFFFFF,
                                        borderRadius:
                                        BorderRadius.circular(8.r),
                                      ),
                                      child: Row(
                                        children: [

                                          Image.asset(AppImages.firefoxImage,height: 18.h,),
                                        UIHelper.horizontalSpace(6.w),

                                          Text(  "Most Popular",style: TextFontStyle.titleStyle14w600cFF4800Manrope),



                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Content Section
                              Padding(
                                padding: EdgeInsets.all(16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "\$ 4.99",
                                          style: TextFontStyle
                                              .titleStyle14w600c212B36Manrope
                                              .copyWith(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 32),
                                        ),
                                      UIHelper.horizontalSpace(4.w),
                                        Text(
                                          "/month",
                                          style: TextFontStyle
                                              .titleStyle14w600c212B36Manrope
                                              .copyWith(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                    UIHelper.verticalSpace(8.h),
                                    ...[
                                      "Create up to 2 ads",
                                      "Access to limited categories",
                                      "Basic performance analytics",
                                      "Email support",
                                    ].map(
                                          (feature) => Padding(
                                        padding: EdgeInsets.only(bottom: 12.h),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                AppIcons.rightClickIcon1,
                                                width: 16.w),
                                            SizedBox(width: 12.w),
                                            Text(
                                              feature,
                                              style: TextFontStyle
                                                  .titleStyle14w600c212B36Manrope
                                                  .copyWith(
                                                  color: AppColors.white,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 14.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                   UIHelper.verticalSpace(16.h),
                                    CustomButton(
                                      name: "Start 7-Day Free Trial",
                                      onCallBack: () {},
                                      borderColor: Colors.white,
                                      borderRadius: 8.r,
                                      color: AppColors.cFF6B34,
                                      context: context,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        UIHelper.verticalSpace(24.h),

                        ///>>>>>>>>>>>>>>>>>>>>>>>> here is the Core Essential >>>>>>>>>>>>>>>>

                        Container(
                          padding: EdgeInsets.all(24.sp),
                          decoration: BoxDecoration(
                            color: AppColors.cFFFFFF,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.r),
                              bottom: Radius.circular(16.r),
                            ),
                            border: Border.all(
                              color: AppColors.cE5E7EB,
                              width: 1.w,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(18.sp),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Free Trial",
                                      style: TextFontStyle.titleStyle24w600primary2Manrope.copyWith(
                                        color: AppColors.c000000,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Content Section
                              Padding(
                                padding: EdgeInsets.all(16.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            " \$ 0",
                                            style: TextFontStyle.titleStyle14w600c212B36Manrope.copyWith(
                                              color: AppColors.c000000,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 32,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Flexible(
                                          child: Text(
                                            "/month",
                                            style: TextFontStyle.titleStyle14w600c212B36Manrope.copyWith(
                                              color: AppColors.c000000,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    UIHelper.verticalSpace(8.h),
                                    ...[
                                      "1 ad slot",
                                      "Basic listing under general category",
                                      "Limited analytics access",
                                      "3 - day trial only",
                                    ].map(
                                          (feature) => Padding(
                                        padding: EdgeInsets.only(bottom: 12.h),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.rightClickIcon2,
                                              width: 16.w,
                                            ),
                                            UIHelper.horizontalSpace(11.w),
                                            Expanded(
                                              child: Text(
                                                feature,
                                                style: TextFontStyle
                                                    .titleStyle14w600c212B36Manrope
                                                    .copyWith(
                                                  color: AppColors.c000000,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.sp,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    UIHelper.verticalSpace(16.h),
                                    CustomButton(
                                      textStyle: TextStyle(color: AppColors.c000000),
                                      name: "Start  Free Trial",
                                      onCallBack: () {},
                                      borderColor: AppColors.primary2,
                                      borderRadius: 8.r,
                                      color: AppColors.cFFFFFF,
                                      context: context,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        UIHelper.verticalSpace(24.h),

                        ///>>>>>>>>>>>>>>>>>>>>>>>> here is the Peak performance >>>>>>>>>>>>>>>>

                        Container(
                          padding:  EdgeInsets.all(24.sp),
                          decoration: BoxDecoration(
                           color: AppColors.cFF6B34,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.r),
                              bottom: Radius.circular(16.r),
                            ),
                            border: Border.all(
                              color: AppColors
                                  .primary2,
                              width: 1.w,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(18),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Professional",
                                      style: TextFontStyle
                                          .titleStyle24w600primary2Manrope
                                          .copyWith(color: AppColors.white),
                                    ),
                                  ],
                                ),
                              ),
                              // Content Section
                              Padding(
                                padding: EdgeInsets.all(16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "\$ 9.99",
                                          style: TextFontStyle
                                              .titleStyle14w600c212B36Manrope
                                              .copyWith(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 32),
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "/month",
                                          style: TextFontStyle
                                              .titleStyle14w600c212B36Manrope
                                              .copyWith(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    UIHelper.verticalSpace(8.h),
                                    ...[
                                      "Unlimited ad creation",
                                      "Category & location targeting",
                                      "Advanced performance tracking ",
                                      "Priority support",
                                      "Upload video/image ads",
                                    ].map(
                                          (feature) => Padding(
                                        padding: EdgeInsets.only(bottom: 12.h),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                AppIcons.rightClickIcon1,
                                                width: 16.w),
                                         UIHelper.horizontalSpace(12.w),
                                            Text(
                                              feature,
                                              style: TextFontStyle
                                                  .titleStyle14w600c212B36Manrope
                                                  .copyWith(
                                                  color: AppColors.cFFFFFF,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 14.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                 UIHelper.verticalSpace(16.h),
                                    CustomButton(
                                      textStyle:
                                      TextStyle(color: AppColors.cFF4800),
                                      name: "Choose Professional",
                                      onCallBack: () {},
                                      borderColor: AppColors.primary2,
                                      borderRadius: 8.r,
                                      color: AppColors.cFFFFFF,
                                      context: context,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpace(24.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              "Other Ways to Join",
                              style: TextFontStyle
                                  .titleStyle14w600c212B36Manrope
                                  .copyWith(
                                  color: AppColors.c000000,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp),
                            ),
                          ],
                        ),

                        UIHelper.verticalSpace(16.h),

                        Container(
                          padding:  EdgeInsets.all(16.sp),
                          decoration: BoxDecoration(
                            color: AppColors.cFFFFFF,
                            border: Border.all(color: AppColors.cE5E7EB),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppIcons.clockIcon, height: 24.h, width: 24.w),
                                     UIHelper.horizontalSpace(8.w),
                                      Text(
                                        'Day pass',
                                        style: TextFontStyle.titleStyle14w600c212B36Manrope.copyWith(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.c000000,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$ 0.99',
                                    style: TextFontStyle.titleStyle14w600c212B36Manrope.copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary2,
                                    ),
                                  ),
                                ],
                              ),
                             UIHelper.verticalSpace(12.h),
                              Text(
                                'Perfect for one-time campaigns or trial users',
                                style: TextFontStyle.titleStyle14w600c212B36Manrope.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.c000000,
                                ),
                              ),
                            ],
                          ),
                        ),

                        UIHelper.verticalSpace(16.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.clockIcon1, height: 24.h, width: 24.w),
                           UIHelper.horizontalSpace(8.w),
                            Text(
                              '7-day free trial available',
                              style: TextFontStyle.titleStyle14w600c212B36Manrope.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.c757575,
                              ),
                            ),
                          ],
                        ),




                        UIHelper.verticalSpace(8.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.rightClickIcon3, height: 24.h, width: 24.w),
                           UIHelper.horizontalSpace(8.w),
                            Text(
                              'Cancel anytime',
                              style: TextFontStyle.titleStyle14w600c212B36Manrope.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.c000000,
                              ),
                            ),
                          ],
                        ),

                        UIHelper.verticalSpace(8.h),

                        Text(
                          'Terms and conditions',
                          style: TextFontStyle.titleStyle14w600c212B36Manrope.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary2,
                          ),
                        ),

                        UIHelper.verticalSpace(11.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
