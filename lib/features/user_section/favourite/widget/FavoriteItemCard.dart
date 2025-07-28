
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteItemCard extends StatefulWidget {
  const FavouriteItemCard({super.key});

  @override
  State<FavouriteItemCard> createState() => _FavouriteItemCardState();
}

class _FavouriteItemCardState extends State<FavouriteItemCard> {

  bool isLove= false;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with overlay badge and heart
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: SizedBox(
                  height: 200,
                  child: Image.asset(
                    AppImages.foodCardImage, // Replace with your actual image
                    height: 140.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.cFF4800,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    '30% Off',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLove = !isLove;
                      print("love is $isLove");
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(Icons.favorite ,
                        size: 18,
                        color: isLove ? AppColors.cFF4800 : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),

          // Text content
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chicken Burger',
                  style: TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 4.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Get 30% ',
                        style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(color: AppColors.cFF4800),
                      ),
                      TextSpan(
                        text: 'off on all menu items',
                        style:  TextFontStyle.titleStyle16w500primary2Manrope.copyWith(color: AppColors.c757575,fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 24, color:AppColors.cFF4800),
                        SizedBox(width: 4),
                        Text('Riyadh', style: TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(color: AppColors.c000000,fontWeight: FontWeight.w400)),
                      ],
                    ),


                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined, size: 24





                            , color:AppColors.cFF4800),
                        SizedBox(width: 4),
                        Text('Valid until Feb 29', style: TextFontStyle.titleStyle18w600c2F2F2FManrope.copyWith(color: AppColors.c000000,fontWeight: FontWeight.w400)),
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
