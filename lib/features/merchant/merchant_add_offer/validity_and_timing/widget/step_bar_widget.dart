
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class StepItem extends StatelessWidget {
  final int index;
  final int currentStep;
  final String title;
  final Function(int) onTap;
  final Color activeColor;
  final Color inactiveColor;

  const StepItem({
    super.key,
    required this.index,
    required this.currentStep,
    required this.title,
    required this.onTap,
    this.activeColor = AppColors.cFF4800,
    this.inactiveColor = AppColors.cD1D1D1,
  });

  Color _getColor() {
    if (index == currentStep) return activeColor;
    if (index < currentStep) return activeColor.withOpacity(0.5);
    return inactiveColor;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          children: [
            CircleAvatar(
              radius: 17.r,
              backgroundColor: _getColor(),
              child: index < currentStep
                  ?  Icon(Icons.check, color: AppColors.cFFFFFF, size: 14.sp)
                  : Text(
                '${index + 1}',
                style:  TextFontStyle.titleStyle14w500cFFFFFFManrope
              ),
            ),
           UIHelper.verticalSpace(8.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: index == currentStep
                  ? TextFontStyle.titleStyle12w500cFF4800Manrope
                  : TextFontStyle.titleStyle12w500c5E5E5EManrope,
            ),

          ],
        ),
      ),
    );
  }
}




















//
//
//
// Text(
// title,
// textAlign: TextAlign.center,
//
// style: TextFontStyle.titleStyle12w500cFF4800Manrope,
// TextFontStyle.titleStyle12w500cFF4800Manrope,
//
//
//
// TextStyle(
// color: _getColor(),
// fontWeight:
// index == currentStep ? FontWeight.bold : FontWeight.normal,
// fontSize: 12,
// ),
// ),