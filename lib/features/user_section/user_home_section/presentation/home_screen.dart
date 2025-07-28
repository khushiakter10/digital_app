
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:digital_app/common_widgets/category_custom_card.dart';
import 'package:digital_app/features/user_section/user_home_section/widget/customMenuCard.dart';
import 'package:digital_app/features/user_section/user_home_section/widget/limited_time_offers.dart';
import 'package:digital_app/features/user_section/user_home_section/widget/popular_near_you_card.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  String selectedCategory = "";

  final List<CategoryItem> categories = [
    CategoryItem(name: "Food & Drinks", icon: AppIcons.foodIcon),
    CategoryItem(name: "Fashion", icon: AppIcons.shoppingIcon),
    CategoryItem(name: "Electronics", icon: AppIcons.electricPartIcon),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,),
          child: SingleChildScrollView(
            child: Column(
              children: [
                UIHelper.verticalSpace(16.h),
                /// Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundImage: AssetImage(AppImages.profileImage2), // Replace with AppImages.profileImage
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Hello, Sarah",
                                style:TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(color: AppColors.c2F2F2F)
                            ),
                            SizedBox(height: 5.h),
                            Text(
                                "How are you feeling today?",
                                style:TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(color: AppColors.c757575,fontSize: 14,)
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.search),
                  ],
                ),
                SizedBox(height: 24.h),

                /// Category Title
                Text(
                    "Category",
                    style: TextFontStyle.titleStyle20w700Whiteinter.copyWith(color: AppColors.c2F2F2F)
                ),
                SizedBox(height: 16.h),

                /// Category Scroll List
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

                ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>> here is the featured section >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Text(
                    "Featured Deals",
                    style: TextFontStyle.titleStyle20w700Whiteinter.copyWith(color: AppColors.c2F2F2F)
                ),
                SizedBox(height: 16.h),

                SizedBox(
                  height: 280.h,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10), // space between cards
                        child: GestureDetector(
                            onTap: (){
                              NavigationService.navigateTo(Routes.userHomeOfferDetailsScreen);
                            },
                            child: FoodOfferCard()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24.h),
                ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>> here is the Popular Near You section >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Text(
                    "Popular Near You",
                    style: TextFontStyle.titleStyle20w700Whiteinter.copyWith(color: AppColors.c2F2F2F)
                ),
                SizedBox(height: 24.h),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10), // space between cards
                      child: GestureDetector(
                          onTap: (){
                            NavigationService.navigateTo(Routes.userHomeOfferDetailsScreen);
                          },
                          child: PopularNearYouCard()),
                    );
                  },
                ),

                Text(
                    textAlign: TextAlign.center,
                    "Limited Time Offers",
                    style: TextFontStyle.titleStyle20w700Whiteinter.copyWith(color: AppColors.c2F2F2F)
                ),
                SizedBox(height: 16.h),



                SizedBox(
                  height: 135.h,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 10.w), // Add horizontal padding
                    physics: const BouncingScrollPhysics(), // For iOS-like scrolling
                    itemBuilder: (context, index) {
                      return LimitedTimeOffers();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

