
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const CustomAppBar({super.key, required this.text});

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return

      AppBar(
      backgroundColor:AppColors.cFFFFFF,
      scrolledUnderElevation: 0,
     toolbarHeight: 50.h,
      elevation: 0,

      leading: GestureDetector(

        onTap: (){
          NavigationService.goBack;
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),

          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(4.r),
              boxShadow: [
                BoxShadow(
                  color: Color(0x14FF4800),
                  blurRadius: 16,
                  offset: Offset(0, 2),
                  spreadRadius: 5,
                )
              ]

          ),
          margin: EdgeInsets.only(left: 11.w,top: 12.w),
          child: SvgPicture.asset(
              AppIcons.backArrowIcon,
          ),
        ),
      ),
      title: Text( text,  style: TextFontStyle.titleStyle32w600c2F2F2FManrope.copyWith(fontSize: 20.sp)),
      centerTitle: true,
    );
  }
}



































