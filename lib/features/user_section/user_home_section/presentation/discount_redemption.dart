
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/features/user_section/user_home_section/presentation/home_offer_details_screen.dart';
import 'package:digital_app/features/user_section/user_home_section/widget/available_discount.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/toast.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserDiscountRedemption extends StatefulWidget {
  const UserDiscountRedemption({super.key});

  @override
  State<UserDiscountRedemption> createState() => _UserDiscountRedemptionState();
}

class _UserDiscountRedemptionState extends State<UserDiscountRedemption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppbarProfile(
        title: "Discount Redemption",
        iconPath: AppIcons.backArrowIcon,
        onIconTap: () => NavigationService.goBack,
      ),
      body: SafeArea(child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
                  decoration:BoxDecoration(
                    color:AppColors.c22C55E,
                    borderRadius: BorderRadius.circular(50.r)
                  ),
                ),
                UIHelper.horizontalSpace(8.w),
                Text( 'Active Account',style: TextFontStyle.titleStyle16w400c454545Manrope),
              ],
            ),
            UIHelper.verticalSpace(16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(19.w),
              decoration: BoxDecoration(
                color: AppColors.cFF4800,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Customer ID',style: TextFontStyle.titleStyle16w400cFFFFFFManrope),
                      UIHelper.verticalSpace(4.h),

                      Text('CUST-8429XJ',   style: TextFontStyle.titleStyle24w600cFFFFFFManrope),

                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(const ClipboardData(text: 'CUST-8429XJ'));
                      // Optional: show a snackbar or toast

                        ToastUtil.showLongToast("Copy success");

                    },
                    child:  SvgPicture.asset(AppIcons.copyIcon,height: 24.h)
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(24.h),
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                 decoration: BoxDecoration(
                   color: AppColors.cFF4800,
                   borderRadius: BorderRadius.circular(16),
                   boxShadow: [
                     BoxShadow(
                       color: AppColors.cFF4800.withOpacity(.1),
                       spreadRadius: 2,
                       blurRadius: .5,

                     )
                   ]
                 ),
                ),
//-------------------------------------------------- Card -----------------------------------//
                Positioned(
                  left: 10,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    height: 150.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
                    decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '25% Off',
                            style: TextFontStyle.titleStyle32w600c2F2F2FManrope.copyWith(fontSize: 24.sp),
                          ),
                          UIHelper.verticalSpace(8.h),
                          Text(
                            'on all purchase above \$50',
                            style: TextFontStyle.titleStyle16w400c454545Manrope,
                          ),
                          UIHelper.verticalSpace(8.h),
                          Text(
                            'Valid until December 31, 2025',
                            style: TextFontStyle.titleStyle14w400c757575Manrope.copyWith(fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
 //------------------------------------- Done ----------------------------------//

              ],



            ),
            UIHelper.verticalSpace(24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    NavigationService.navigateTo(Routes.userScanQrCodeScreen);

                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:  Size(120, 53),
                    padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    backgroundColor: AppColors.cFF4800,
                    elevation: 4,
                    shadowColor:  Color(0x14000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        width: 1,
                        color: Color(0xFFFF4800),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.vercode),
                    UIHelper.horizontalSpace(8.w),
                      Text('Show QR Code', style: TextFontStyle.titleStyle14w500cFFFFFFManrope),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {

                    NavigationService.navigateTo(Routes.userIdCardScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 53),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    backgroundColor: AppColors.cFF4800,
                    elevation: 4,
                    shadowColor: const Color(0x14000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        width: 1,
                        color: Color(0xFFFF4800),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.identity),
                      const SizedBox(width: 8),
                      Text(
                        'View ID Card',
                        style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                          color: AppColors.cFFFFFF,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            UIHelper.verticalSpace(24.h),
            Text(
              'How to Redeem',
              style: TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(
                  fontWeight: FontWeight.w700
              ),),
            UIHelper.verticalSpace(16),




            OfferRedeemCard(
              icon: AppIcons.vercode,
              title: "Scan QR Code",
              subTitle: "Show this QR code to the merchant at checkout to redeem your discount instantly",
            ),
            UIHelper.verticalSpace(16.h),
            OfferRedeemCard(
              icon: AppIcons.identity,
              title: "Use Physical Card",
              subTitle: "Present your physical discount card and provide your Customer ID to the merchant",
            ),
            UIHelper.verticalSpace(24),
            Text(
              'Available Discounts',
              style: TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(
                  fontWeight: FontWeight.w700
              ),),
            UIHelper.verticalSpace(24),

            SizedBox(
              height: 220.h,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                return  AvailableDiscountCard();
              },),
            )





          ],
        ),
      )),
    );
  }
}


