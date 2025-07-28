import 'dart:io';
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDottedWidget extends StatelessWidget {
  final TabController tabController;
  final File? selectedImage;
  final VoidCallback onPickImage;

  const CustomDottedWidget({
    super.key,
    required this.tabController,
    required this.selectedImage,
    required this.onPickImage,
  });

  Widget _buildDottedWidget() {
    return GestureDetector(
      onTap: onPickImage,
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
                Image.asset(AppImages.uploadImage,height: 36.h,),
                  UIHelper.verticalSpace(16.h),
                  Text(
                    'Upload Video',
                    style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp),
                  ),
                  UIHelper.verticalSpace(8.h),
                  Text(
                    '(MP4, MOV up to 20MB))',
                    style: TextFontStyle.titleStyle14w500c757575Manrope,
                  ),
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
    return SizedBox(
      height: 173.h,
      child: TabBarView(
        controller: tabController,
        children: [
          _buildDottedWidget(),
          _buildDottedWidget(),
        ],
      ),
    );
  }
}
