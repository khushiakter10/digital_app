
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbarProfile extends StatelessWidget implements PreferredSizeWidget {
  final String title, iconPath;
  final VoidCallback onIconTap;
  final bool showIcon;
  final double textSize; // textSize parameter

  const CustomAppbarProfile({
    required this.title,
    required this.iconPath,
    required this.onIconTap,
    this.showIcon = true,
    this.textSize = 19.04, // Default value, not required
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(55.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [

            showIcon
                ? GestureDetector(
              onTap: onIconTap,
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
                child: Center(child: SvgPicture.asset(iconPath)),
              ),
            )
                : SizedBox(width: 40.w, height: 40.h),
            // UIHelper.horizontalSpace(15.w), // Add space between icon and title
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: textSize.sp, // Use textSize parameter
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF182245),
                    fontFamily: 'Manrope',
                  ),
                ),
              ),
            ),
            SizedBox(width: 40.w),
          ],
        ),
      ),
      backgroundColor: AppColors.cFFFFFF,
      elevation: 0,

    );
  }
}