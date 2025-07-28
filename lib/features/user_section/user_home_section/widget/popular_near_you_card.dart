
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:flutter/material.dart';

class PopularNearYouCard extends StatelessWidget {
  const PopularNearYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 99,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0xFFE5E7EB) /* card-stroke */,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          Container(
            width: 67,
            height: 74,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.foodCardImage),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 8,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      SizedBox(
                        width: 224,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: '25% off',
                                  style: TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(color: AppColors.cFF4800)
                              ),
                              TextSpan(
                                text: ' - Coffee Corner',
                                style:  TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(),
                          ),
                          SizedBox(
                            width: 177,
                            child: Text(
                                '4.8 Japan Food & Drinks ',
                                style: TextFontStyle.titleStyle14w400grey888E9CManrope
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
