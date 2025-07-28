
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserSubscriptionScreen extends StatelessWidget {
  const UserSubscriptionScreen({super.key});

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

 //------------------------------------ Appbar ---------------------------------------------------//

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(4.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14FF4800),
                                blurRadius: 16,
                                offset: Offset(0, 2),
                                spreadRadius: 5,
                              ),
                            ],
                          ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Choose Your Plan',
                              style: TextFontStyle
                                  .titleStyle20w700c181818Manrope
                                  .copyWith(color: AppColors.c2F2F2F)),
                          UIHelper.verticalSpace(4.h),
                          Text(
                            "Get access to exclusive deals and offers",
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextFontStyle
                                .titleStyle12w500c5E5E5EManrope
                                .copyWith(color: AppColors.c757575),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        NavigationService.popAndReplace(Routes.userMainBottomNavScreen);
                      },
                      child: Text('Skip',
                          style: TextFontStyle.titleStyle14w500WhiteManrope
                              .copyWith(color: AppColors.primary2)),
                    ),
                  ],
                ),
//------------------------------------------ Done -------------------------------------------------//

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        UIHelper.verticalSpace(12.h),

//---------------------------------------------  Basic Most Popular Subscription --------------------------------//

                        Container(
                          padding:  EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                            color: AppColors.cFF6B34,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding:  EdgeInsets.all(18.sp),
                                decoration: BoxDecoration(
                                  color: AppColors.cFF6B34,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16.r)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text("Basic", style: TextFontStyle.titleStyle24w600cFFFFFFManrope),

                                    Container(
                                      height: 40.h,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w, vertical: 6.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(AppIcons.firIcons,height: 18.sp,),
                                         UIHelper.horizontalSpace(6.w),

                                          Text( "Most Popular", style: TextFontStyle .titleStyle14w600cFF4800Manrope),

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
                                      crossAxisAlignment:CrossAxisAlignment.end,
                                      children: [
                                        Text("\$2.99",style: TextFontStyle.titleStyle24w600cFFFFFFManrope.copyWith(fontSize: 32.sp)),


                                        UIHelper.horizontalSpace(4.w),
                                        Text("/month",  style: TextFontStyle.titleStyle24w600cFFFFFFManrope.copyWith(fontSize: 14.sp)),

                                      ],
                                    ),
                                    UIHelper.verticalSpace(8.h),
                                    ...[
                                      "Unlimited QR codes",
                                      "All standard offers",
                                      "Save favorite shops",
                                      "Redemption history",
                                    ].map(
                                      (feature) => Padding(
                                        padding: EdgeInsets.only(bottom: 12.h),
                                        child: Row(
                                          children: [

                                            SvgPicture.asset(
                                                AppIcons.rightClickIcon1,
                                                width: 16.w),

                                            UIHelper.horizontalSpace(12.w),
                                            Text(feature,style: TextFontStyle.titleStyle14w500cFFFFFFManrope




                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                 UIHelper.verticalSpace(16.h),
                                    CustomButton(
                                      name: "Start 7-Day Free Trial",
                                      onCallBack: () {},
                                      borderColor: AppColors.cFFFFFF,
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
//--------------------------------------------- Done ------------------------------------------------//


//-------------------------------------------- here is the Core Essential ----------------------------//


                        Container(
                          padding:  EdgeInsets.all(24.sp),
                          decoration: BoxDecoration(
                            color: AppColors.cFFFFFF,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.r),
                              bottom: Radius.circular(16.r),
                            ),

                            border: Border.all(color: AppColors.cE5E7EB, width: 2.w)),


                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Free",style: TextFontStyle.titleStyle32w600c2F2F2FManrope.copyWith(fontSize: 24.sp)),

                                  ],
                                ),
                              ),
                              // Content Section
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  UIHelper.verticalSpace(16.h),

                                  Row(
                                    crossAxisAlignment:CrossAxisAlignment.end,

                                    children: [
                                      Text("\$0",style: TextFontStyle.titleStyle32w600c2F2F2FManrope.copyWith(fontSize: 32.sp)),

                                      UIHelper.horizontalSpace(4.w),

                                      Text("/month", style: TextFontStyle   .titleStyle14w400c2F2F2FManrope),




                                    ],
                                  ),
                                  UIHelper.verticalSpace(8.h),
                                  ...[
                                    "1 offer per week",
                                    "Basic account access",
                                    "Customer ID only",
                                  ].map(
                                    (feature) => Padding(
                                      padding: EdgeInsets.only(bottom: 12.h),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              AppIcons.rightClickIcon2,
                                              width: 16.w),

                                         UIHelper.horizontalSpace(12.w),

                                          Text(feature,style:TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),



                                        ],
                                      ),
                                    ),
                                  ),
                              UIHelper.verticalSpace(16.h),
                                  CustomButton(
                                    textStyle:
                                        TextStyle(color: AppColors.c000000),
                                    name: "Start 7-Day Free Trial",
                                    onCallBack: () {},
                                    borderColor: AppColors.primary2,
                                    borderRadius: 8.r,
                                    color: AppColors.white,
                                    context: context,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpace(24.h),
//----------------------------------------------- Done -----------------------------------------------------//


//-------------------------------------------  here is the Peak performance--------------------------------- //
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
                              width: 2.w,
                            ),
                          ),
                          child: Column(
                            children: [
                              // Header Section
                              Container(
                                padding:  EdgeInsets.all(18.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text( "Premium",style: TextFontStyle.titleStyle24w600cFFFFFFManrope),

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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text("\$ 4.99",style: TextFontStyle.titleStyle24w600cFFFFFFManrope.copyWith(fontSize: 32.sp)),
                                       UIHelper.horizontalSpace(4.w),
                                        Text("/month",  style: TextFontStyle.titleStyle24w600cFFFFFFManrope.copyWith(fontSize: 14.sp))
                                      ],
                                    ),
                                    UIHelper.verticalSpace(8.h),
                                    ...[
                                      "All Basic features",
                                      "Premium offers",
                                      "Early access deals",
                                      "Location notifications",
                                      "Gift offers feature",
                                    ].map(
                                      (feature) => Padding(
                                        padding: EdgeInsets.only(bottom: 12.h),
                                        child: Row(
                                          children: [


                                            SvgPicture.asset(
                                            AppIcons.rightClickIcon1,width: 16.w),


                                        UIHelper.horizontalSpace(12.w),
                                        Text(feature,style: TextFontStyle.titleStyle14w500cFFFFFFManrope)
                                          ],
                                        ),
                                      ),
                                    ),
                                  UIHelper.verticalSpace(16.h),
                                    CustomButton(
                                      textStyle:
                                          TextStyle(color: AppColors.c000000),
                                      name: "Choose Premium",
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

//-------------------------------------------------- Done ----------------------------------------------------//

//-------------------------------------- Other section -----------------------------------------------------//
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(   "Other Ways to Join",  style: TextFontStyle .titleStyle32w600c2F2F2FManrope.copyWith(fontSize: 20.sp),
                              textAlign: TextAlign.start,

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

                                  Text('Day pass',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 18),

                                  ),
                                ],
                              ),
                              Text('\$ 0.99', style: TextFontStyle.titleStyle12w500cFF4800Manrope.copyWith( fontSize: 20)),
                            ],
                          ),
                           UIHelper.verticalSpace(12.h),

                          Text('Perfect for tourists and occasional users', style: TextFontStyle.titleStyle14w400c2F2F2FManrope.copyWith(fontSize: 14)),

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
                              style: TextFontStyle.titleStyle14w400c757575Manrope.copyWith(
                                fontSize: 16.sp,
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

                    Text( 'Terms and conditions',style: TextFontStyle.titleStyle12w500cFF4800Manrope.copyWith(fontSize: 16.sp)),



//-------------------------------------- Done -------------------------------------------------//

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







