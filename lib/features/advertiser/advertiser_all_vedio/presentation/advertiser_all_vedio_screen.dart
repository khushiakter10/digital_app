
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/features/advertiser/advertiser_all_vedio/widget/custom_active.dart';
import 'package:digital_app/features/advertiser/advertiser_all_vedio/widget/vedio_widget.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdvertiserAllVedioScreen extends StatefulWidget {
  const AdvertiserAllVedioScreen({super.key});

  @override
  State<AdvertiserAllVedioScreen> createState() =>
      _AdvertiserAllVedioScreenState();
}

class _AdvertiserAllVedioScreenState extends State<AdvertiserAllVedioScreen> {


  bool isLoved = false;
  final List<Map<String, dynamic>> categories = const [
    {'label': 'Active Videos 4'},
    {'label': 'Paused Videos 1'},
    {'label': 'Paused Offers 3'},
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF9FAFB,
      appBar: CustomAppbarProfile(
        showIcon: false,
        title: "Offers Management",
        iconPath: AppIcons.apple,
        onIconTap: () => NavigationService.goBack,textSize: 17,),

      body: Padding(

        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------------------  active section ----------------------------------------//
            SizedBox(
              height: 40.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: CustomActiveWidget(
                        borderRadius: BorderRadius.circular(32.r),
                        label: category['label'],
                        isSelected: index == selectedIndex,
                        isDisabled: false,
                      ),
                    ),
                  );
                },
              ),
            ),
            UIHelper.verticalSpace(10.h),
            // --------------------------------------- Done ---------------------------------------------//

            //--------------------------------------- Vedio section  -----------------------------------------------------------------//

            Expanded(
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return WidgetDesign(
                    title: 'Summer Sale - UP to 40% off',
                    type: 'mp4',
                    sets: '20 seconds',
                    videoPath:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    index: index,
                  );
                },
              ),
            ),

            //--------------------------------------- Vedio section  -----------------------------------------------------------------//
            UIHelper.verticalSpace(70.h)
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: AppColors.cFF4800,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: SvgPicture.asset(AppIcons.addicon),
          onPressed: () {
            NavigationService.navigateTo(Routes.advertiserCreateNewAdScreen);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}