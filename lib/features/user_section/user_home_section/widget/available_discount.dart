
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AvailableDiscountCard extends StatelessWidget {
  const AvailableDiscountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      width: 250.w,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0xFFE5E7EB) /* card-stroke */,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Container(
            width: 250,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Container(
                  width: 195,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Text(
                              '20% OFF',
                              style: TextStyle(
                                color: const Color(0xFFFF4800) /* Primary-color */,
                                fontSize: 20,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                                height: 1.50,
                              ),
                            ),
                            SvgPicture.asset(AppIcons.discountCard)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          'Coffe Shop',
                          style: TextStyle(
                            color: const Color(0xFF181818),
                            fontSize: 18,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            height: 1.50,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          'Valid until June 30',
                          style: TextStyle(
                            color: const Color(0xFF454545),
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Handle redeem action
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(240, 40),
              backgroundColor: const Color(0xFFFF4800), // Primary color
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 4, // Similar to BoxShadow blur
              shadowColor: const Color(0x14000000),
            ),
            child: Text(
                'Redeem Now',
                style:TextFontStyle.titleStyle14w400grey888E9CManrope.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                )
            ),
          )

        ],
      ),
    );
  }
}