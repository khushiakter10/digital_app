
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:digital_app/common_widgets/category_custom_card.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/features/merchant/edit_stor_information/presentation/widget/custom_location.dart';
import 'package:digital_app/features/user_section/user_home_section/presentation/diraction_screen.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class UserHomeOfferDetailsScreen extends StatefulWidget {
  const UserHomeOfferDetailsScreen({super.key});

  @override
  State<UserHomeOfferDetailsScreen> createState() => _UserHomeOfferDetailsScreenState();
}

class _UserHomeOfferDetailsScreenState extends State<UserHomeOfferDetailsScreen> {

  dynamic   destinationLat= 23.8103;
  dynamic destinationLng = 90.4125;
  String selectedCategory = "";
  final List<CategoryItem> categories = [
    CategoryItem(name: "Save to favorites", icon: AppIcons.loveIconActive),
    CategoryItem(name: "Share offer", icon: AppIcons.share),
    CategoryItem(name: "Report", icon: AppIcons.report),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbarProfile(title: "Offer Details", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,showIcon: true,),
        backgroundColor: AppColors.cFFFFFF,
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,),
          child: SingleChildScrollView(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              UIHelper.verticalSpace(16.h),

              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 209,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.foodCardImage),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 10,
                    top: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFF4800),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                              '30% Off',
                              style: TextFontStyle.titleStyle14w400grey888E9CManrope.copyWith(fontWeight: FontWeight.w600,color: Colors.white)
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              UIHelper.verticalSpace(16.h),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Text(
                        'Chicken Burger',
                        style: TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(
                            fontWeight: FontWeight.w700
                        )
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        SvgPicture.asset(AppIcons.star),
                        Text(
                            '4.8 (166)',
                            style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(16.h),
              RowCardInOffer(text: "Valid until Feb 29",icon: AppIcons.clock,),
              UIHelper.verticalSpace(12.h),
              RowCardInOffer(text: " Riyadh – Al Olaya branch",icon: AppIcons.location2,),
              UIHelper.verticalSpace(24.h),
              Text(
                'Get 30% off on all menu items',
                style: TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(
                    fontWeight: FontWeight.w700
                ),

              ),
              UIHelper.verticalSpace(16.h),
              RowCardInOffer(text: "No minimum order required",icon: AppIcons.rightGreen,),
              UIHelper.verticalSpace(12.h),
              RowCardInOffer(text: "Valid for dine-in & takeaway",icon: AppIcons.rightGreen,),
              UIHelper.verticalSpace(12.h),
              RowCardInOffer(text: "Valid for dine-in & takeaway",icon: AppIcons.cross,),

              UIHelper.verticalSpace(14.h),
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
                'Location & Directions ',
                style: TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(
                    fontWeight: FontWeight.w700
                ),),
              UIHelper.verticalSpace(16),

              LocationScreen(destinationLat: destinationLat,destinationLng: destinationLng,),

              UIHelper.verticalSpace(24.h),


              ElevatedButton(
                onPressed: () {
                  Get.to(UserDirectionScreen(
                    destinationLat: destinationLat,
                    destinationLng: destinationLng,
                  ));

                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 53),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  backgroundColor: Colors.white,
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
                    SvgPicture.asset(AppIcons.location2),
                    const SizedBox(width: 8),
                    Text(
                      'Get Directions',
                      style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                        color: AppColors.c000000,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              /// Category Scroll List
              ///
              ///
              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = selectedCategory == category.name;

                    return CategoryCard(
                      category: category,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          selectedCategory = category.name;
                          print(selectedCategory.toString());
                        });
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),


              ElevatedButton(
                onPressed: () {

                  NavigationService.navigateTo(Routes.userDiscountRedemption);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 53),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                    SvgPicture.asset(AppIcons.vercode),
                    const SizedBox(width: 8),
                    Text(
                      'Redeem Now',
                      style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                        color: AppColors.cFFFFFF,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),),
        ))
    );
  }
}

















class OfferRedeemCard extends StatelessWidget {
  const OfferRedeemCard({
    super.key, required this.title, required this.icon, required this.subTitle,
  });
  final String title;
  final String subTitle;
  final String icon;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: ShapeDecoration(
        color: const Color(0xFFF9FAFB),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFF4800) /* Primary-color */,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child:SvgPicture.asset(icon)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 220,
                    child: Text(
                        title,
                        style:TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(color: Colors.black,fontWeight: FontWeight.w700)
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                        subTitle,
                        style: TextFontStyle.titleStyle12w500c5E5E5EManrope.copyWith(
                            color: Colors.black87
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}









class RowCardInOffer extends StatelessWidget {
  const RowCardInOffer({
    super.key, required this.text, required this.icon,
  });

  final String text;
  final String icon;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 6,
      children: [
        SvgPicture.asset(icon),
        Text(
            text,
            style:TextFontStyle.titleStyle16w500primary2Manrope.copyWith(color: Colors.black)
        ),
      ],
    );
  }
}
