
import 'dart:io';
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/features/advertiser/advertiser_create_new_ad/widget/tabbar_widget.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';



class AdvertiserCreateNewAdScreen extends StatefulWidget {
  const AdvertiserCreateNewAdScreen({super.key});

  @override
  State<AdvertiserCreateNewAdScreen> createState() => _AdvertiserCreateNewAdScreenState();
}

class _AdvertiserCreateNewAdScreenState extends State<AdvertiserCreateNewAdScreen> with SingleTickerProviderStateMixin {

  final TextEditingController addtitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();






  late TabController tabController;
  final ImagePicker picker = ImagePicker();
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    addtitleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }



  Widget _buildDottedWidget() {
    return GestureDetector(
      onTap: _pickImageFromGallery,
      child: DottedBorder(
        color: AppColors.cE8E8E8,
        strokeWidth: 3.w,
        dashPattern: [8, 4],
        borderType: BorderType.RRect,
        radius: Radius.circular(2.r),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Container(
            height: 400.h,
            width: double.infinity,
            color: selectedImage == null ? Colors.transparent : null,
            child: selectedImage == null
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.gallryIcon),
                  UIHelper.verticalSpace(12.h),
                  Text('Tap to upload Image',
                      style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
                  UIHelper.verticalSpace(8.h),
                  Text('(Accepts .jpg, .png (max 5MB))',
                      style: TextFontStyle.titleStyle14w500c757575Manrope),
                ],
              ),
            )
                : Image.file(
              selectedImage!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.cFFFFFF,
        appBar: CustomAppbarProfile(title: "Create New Ad.", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,),

        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
 //------------------------------------------------ TabbarWidget -----------------------------------------//
              TabbarWidget(
                tabController: tabController,
                tabTitles: ['Image Ad.', 'Video Ad.'],
              ),
              UIHelper.verticalSpace(24.h),
              SizedBox(
                height: 173.h,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    _buildDottedWidget(),
                    _buildDottedWidget(),
                  ],
                ),
              ),
//----------------------------------------------- Done ----------------------------------------------//

//-------------------------------------------- add title textformfield  ----------------------------------------------------------------//

              UIHelper.verticalSpace(24.h),
              Text('Add Title',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
              UIHelper.verticalSpace(8.h),

              CustomTextfield(
                controller: addtitleController,
                borderRadius: 8.r ,
                fillColor: AppColors.cFFFFFF,
                borderColor:  AppColors.cE8E8E8,
                hintText: 'Enter add title',
              ),

              UIHelper.verticalSpace(24.h),
//----------------------------------------- description textformfild section ----------------------------------------------------//
              Text('Description',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
              UIHelper.verticalSpace(8.h),

              CustomTextfield(
                controller: descriptionController,
                borderRadius: 8.r ,
                maxline: 4,
                fillColor: AppColors.cFFFFFF,
                borderColor: AppColors.cE8E8E8,
                hintText: 'Enter description',
              ),

              UIHelper.verticalSpace(26.h),
//---------------------------------------------------- button --------------------------------------------//
              CustomButton(
                name: "Next",
                context: context,
                color: AppColors.primary2,
                height: 56.h,
                borderRadius: 8.r,
                textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
                onCallBack: () {
                  NavigationService.navigateTo(Routes.targateCategoryScreen);
                },
              ),
            ],
          ),
        ),
        ),

    );
  }
}


