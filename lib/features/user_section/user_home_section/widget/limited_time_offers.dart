// import 'package:brayne_digital_app/assets_helper/app_image.dart';
// import 'package:brayne_digital_app/helpers/ui_helpers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class LimitedTimeOffers extends StatelessWidget {
//   const LimitedTimeOffers({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       width: double.infinity,
//       height: 126,
//       decoration: ShapeDecoration(
//         color: const Color(0x19FF4800),
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             width: 1,
//             color: const Color(0xFFFF4800),
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         spacing: 10,
//         children: [
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             spacing: 10,
//             children: [
//               UIHelper.horizontalSpace(10.w),
//               Container(
//                 width: 220,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   spacing: 10,
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//
//                         children: [
//                           Container(
//                             width: 220,
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               spacing: 8,
//                               children: [
//                                 SizedBox(
//                                   width: 219,
//                                   child: Text(
//                                     'Burger Sale!',
//                                     style: TextStyle(
//                                       color: const Color(0xFF181818),
//                                       fontSize: 18,
//                                       fontFamily: 'Manrope',
//                                       fontWeight: FontWeight.w500,
//                                       height: 1.50,
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   width: double.infinity,
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         width: 219,
//                                         child: Text(
//                                           'Up to 70% off on selected items',
//                                           style: TextStyle(
//                                             color: const Color(0xFF757575),
//                                             fontSize: 14,
//                                             fontFamily: 'Manrope',
//                                             fontWeight: FontWeight.w400,
//                                             height: 1.50,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Text(
//                       'Ends in 2h 30m',
//                       style: TextStyle(
//                         color: const Color(0xFFFF4800),
//                         fontSize: 14,
//                         fontFamily: 'Manrope',
//                         fontWeight: FontWeight.w600,
//                         height: 1.50,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: 70,
//                 height: 87,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(AppImages.splash),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//
//
//
//
//
//
//
//
//
//   }
// }


import 'package:digital_app/assets_helper/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LimitedTimeOffers extends StatelessWidget {
  const LimitedTimeOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w, // Set a fixed width for each item
      height: 126.h,
      margin: EdgeInsets.only(right: 10.w), // Add spacing between items
      decoration: ShapeDecoration(
        color: const Color(0x19FF4800),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFFF4800)),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Burger Sale!',
                    style: TextStyle(
                      color: const Color(0xFF181818),
                      fontSize: 18.sp,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Up to 70% off on selected items',
                    style: TextStyle(
                      color: const Color(0xFF757575),
                      fontSize: 14.sp,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Ends in 2h 30m',
                    style: TextStyle(
                      color: const Color(0xFFFF4800),
                      fontSize: 14.sp,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              width: 70.w,
              height: 87.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: AssetImage(AppImages.foodCardImage), // Replace with your actual image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}