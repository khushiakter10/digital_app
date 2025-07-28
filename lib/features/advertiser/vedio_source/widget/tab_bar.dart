import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabbarWidget extends StatelessWidget {
  final TabController tabController;
  final List<String> tabTitles;

  const TabbarWidget({
    super.key,
    required this.tabController,
    required this.tabTitles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.cFFFFFF,
      ),
      child: Row(
        children: List.generate(tabTitles.length, (index) {
          final bool isSelected = tabController.index == index;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                tabController.animateTo(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.cFF4800 : AppColors.cE8E8E8,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(index == 0 ? 8.r : 0),
                    bottomLeft: Radius.circular(index == 0 ? 8.r : 0),
                    topRight: Radius.circular(index == tabTitles.length - 1 ? 8.r : 0),
                    bottomRight: Radius.circular(index == tabTitles.length - 1 ? 8.r : 0),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabTitles[index],
                  style: isSelected
                      ? TextFontStyle.headline18w500cFFFFFF
                      : TextFontStyle.titleStyle14w400c5E5E5EManrope,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}