
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/features/user_section/user_home_section/widget/customer_widget.dart';
import 'package:digital_app/features/user_section/user_home_section/widget/how_to_use_custom_widget.dart';
import 'package:digital_app/features/user_section/user_home_section/widget/import_widget.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserIdCardScreen extends StatefulWidget {
  const UserIdCardScreen({super.key});

  @override
  State<UserIdCardScreen> createState() => _UserIdCardScreenState();
}

class _UserIdCardScreenState extends State<UserIdCardScreen> {
  final List<String> craditIcon = [
    "assets/icons/craditCard.svg",
    "assets/icons/calander_stok.svg",
    "assets/icons/card_stock.svg",
    "assets/icons/checkmark-circcle.svg",
  ];

  final List<String> title = [
    "Customer ID",
    "Issue Date",
    "Card Type",
    "Status",
  ];

  final List<String> subtitle = [
    "CUST-8429XJ",
    "September 15, 2025",
    "Premium Discount Card",
    "Active",
  ];
  ////////////////////////////////////////////////////////// How to use //////////////////////

  final List<String> cardStoreIcon = [
    "assets/icons/cardStor.svg",
    "assets/icons/qr_code.svg",
    "assets/icons/gift-stroke-.svg",
  ];

  final List<String> cardtitle = [
    "Show your card in store",
    "Let staff scan the QR Code",
    "Enjoy your discounts",
  ];

  final List<String> cardsubtitle = [
    "Present your card to the staff",
    "Staff will scan the QR code for verification",
    "Use you card to get special offers",
  ];
/////////////////////////////////////////// Important Notes //////////////////////////////

  final List<String> imporTantNotesText = [
    "Card must be presented at checkout",
    "Cannot be combined with other offers",
    "Lost cards must be reported immediately",
    "Valid only at participating stores",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarProfile(title: "Offer Details", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,showIcon: true,),
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(

        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(16.h),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                color: AppColors.cFF4800,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.membarShip, height: 24.h),
                          UIHelper.horizontalSpace(4.w),
                          Text(
                            'Membership card',
                            style: TextFontStyle.titleStyle16w400cFFFFFFManrope,
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: Offset(0, -17.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'CUST-8429XJ',
                              style: TextFontStyle.titleStyle24w600cFFFFFFManrope,
                            ),
                            Image.asset(
                              AppImages.scanImage,
                              height: 121.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              UIHelper.verticalSpace(24.h),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: craditIcon.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomerWidget(
                      title: title[index],
                      craditIcon: SvgPicture.asset(craditIcon[index]),
                      subtitle: subtitle[index]);
                },
              ),
              UIHelper.verticalSpace(24.h),
              Text(
                'How to Use',
                style: TextFontStyle.titleStyle16w600c181818Manrope
                    .copyWith(fontSize: 14.sp),
              ),
              UIHelper.verticalSpace(24.h),
        
              /////////////////////////////////////////////////How to use /////////////////////////////////
        
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cardStoreIcon.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return HowToUseCustomWidget(
                    cardStoreIcon: SvgPicture.asset(cardStoreIcon[index]),
                    cardtitle: cardtitle[index],
                    cardsubtitle: cardsubtitle[index],
                  );
                },
              ),
        
              UIHelper.verticalSpace(24.h),
              ImportWidget(imporTantNotesText: imporTantNotesText),
              UIHelper.verticalSpace(24.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar:

      SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: CustomButton(
            name: "Download DIgital Card",
            context: context,
            color: AppColors.primary2,
            height: 56.h,
            borderRadius: 8.r,
            textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
            onCallBack: () {
             // NavigationService.navigateTo(Routes.redemptionRulseScreen);
            },
          ),
        ),
      ),
    );
  }
}
