
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/features/merchant/merchant-home_screen/presentation/merchant_home_screen.dart';
import 'package:digital_app/features/merchant/merchant-home_screen/presentation/merchant_scan_qr_code_screen.dart';
import 'package:digital_app/features/merchant/merchant_offer/presentation/merchant_offer_screen.dart';
import 'package:digital_app/features/merchant/merchant_profile/merchant_profile/presentation/merchant_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MerchantBottomNavScreen extends StatefulWidget {
  final int initialIndex;

  const MerchantBottomNavScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MerchantBottomNavScreen> createState() => _MerchantBottomNavScreenState();
}

class _MerchantBottomNavScreenState extends State<MerchantBottomNavScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [
    MerchantHomeScreen(),
    MerchantOfferScreen(),
    MerchantScanQrCodeScreen(),
    MerchantProfile(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.white,
        ),
        child: Container(

          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.cFFF7F5,
                blurRadius: 4,
                offset: Offset(0, -4),
                spreadRadius: 0,
              )
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: onItemTapped,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.grey888E9C,
            showUnselectedLabels: true,

            type: BottomNavigationBarType.fixed,


            // selectedLabelStyle: TextStyle(
            //   fontSize: 12.sp, // টেক্সট সাইজ ছোট করুন
            //   height: -1, // টেক্সট এবং আইকনের মাঝে স্পেস কমান
            // ),
            // unselectedLabelStyle: TextStyle(
            //   fontSize: 12.sp,
            //   height: 3,
            // ),
            items: [
              BottomNavigationBarItem(
                icon: AnimatedContainer(


                  duration: Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(0, _selectedIndex == 0 ? -27 : 0, 0),
                  child: SvgPicture.asset(
                    _selectedIndex == 0 ? AppIcons.homeIconActive : AppIcons.homeIconInactive,
                    width: _selectedIndex == 0 ? 46.w : 24.w,
                    height: _selectedIndex == 0 ? 46.h : 24.h,
                  ),
                ),
                label: 'Home',
              ),

              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(0, _selectedIndex == 1 ? -27 : 0, 0),
                  child: SvgPicture.asset(
                    _selectedIndex == 1 ? AppIcons.offerIconActive : AppIcons.offerIconInactive,
                    width: _selectedIndex == 1 ? 46.w : 24.w,
                    height: _selectedIndex == 1 ? 46.h : 24.h,
                  ),
                ),
                label: 'Offer',
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(0, _selectedIndex == 2 ? -27 : 0, 0),
                  child: SvgPicture.asset(
                    _selectedIndex == 2 ? AppIcons.navigationScanActiveIcon : AppIcons.navigationScanInActiveIcon,
                    width: _selectedIndex == 2 ? 46.w : 24.w,
                    height: _selectedIndex == 2 ? 46.h : 24.h,
                  ),
                ),
                label: 'Scan',
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(0, _selectedIndex == 3 ? -27 : 0, 0),
                  child: SvgPicture.asset(
                    _selectedIndex == 3 ? AppIcons.profileIconActive : AppIcons.profileIconInactive,
                    width: _selectedIndex == 3 ? 46.w : 24.w,
                    height: _selectedIndex == 3 ? 46.h : 24.h,
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:brayne_digital_app/assets_helper/app_colors.dart';
// import 'package:brayne_digital_app/assets_helper/app_icons.dart';
// import 'package:brayne_digital_app/features/merchant/merchant-home_screen/presentation/merchant_home_screen.dart';
// import 'package:brayne_digital_app/features/merchant/merchant-home_screen/presentation/merchant_scan_qr_code_screen.dart';
// import 'package:brayne_digital_app/features/merchant/merchant_offer/presentation/merchant_offer_screen.dart';
// import 'package:brayne_digital_app/features/merchant/merchant_profile/merchant_profile/presentation/merchant_profile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class MerchantBottomNavScreen extends StatefulWidget {
//   final int initialIndex;
//
//   const MerchantBottomNavScreen({
//     super.key,
//     this.initialIndex = 0,
//   });
//
//   @override
//   State<MerchantBottomNavScreen> createState() => _MerchantBottomNavScreenState();
// }
//
// class _MerchantBottomNavScreenState extends State<MerchantBottomNavScreen> {
//   late int _selectedIndex;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedIndex = widget.initialIndex;
//   }
//
//   final List<Widget> _screens = [
//     const MerchantHomeScreen(),
//     const MerchantOfferScreen(),
//     const MerchantScanQrCodeScreen(),
//     const MerchantProfile(),
//   ];
//
//   void onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//           canvasColor: AppColors.white,
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: AppColors.cFFF7F5,
//                 blurRadius: 4,
//                 offset: const Offset(0, -4),
//                 spreadRadius: 0,
//               ),
//             ],
//           ),
//           child: BottomNavigationBar(
//             currentIndex: _selectedIndex,
//             onTap: onItemTapped,
//             selectedItemColor: AppColors.primary,
//             unselectedItemColor: AppColors.grey888E9C,
//             showSelectedLabels: true, // সিলেক্টেড লেবেল দেখানোর জন্য
//             showUnselectedLabels: true, // আনসিলেক্টেড লেবেল দেখানোর জন্য
//             type: BottomNavigationBarType.fixed,
//             selectedLabelStyle: TextStyle(
//               fontSize: 12.sp,
//               height: 1.2, // টেক্সট এবং আইকনের মাঝে স্পেস কমানো
//             ),
//             unselectedLabelStyle: TextStyle(
//
//               fontSize: 12.sp,
//               height: 1.2, // সিলেক্টেড এবং আনসিলেক্টেড টেক্সটের জন্য একই হাইট
//             ),
//             items: [
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(bottom: 4.h), // আইকন এবং টেক্সটের মাঝে স্পেস
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 300), // স্মুথ অ্যানিমেশন
//                     curve: Curves.easeInOut, // অ্যানিমেশন কার্ভ
//                     transform: Matrix4.translationValues(0, _selectedIndex == 0 ? -10 : 0, 0), // কম মুভমেন্ট
//                     child: SvgPicture.asset(
//                       _selectedIndex == 0 ? AppIcons.homeIconActive : AppIcons.homeIconInactive,
//                       width: _selectedIndex == 0 ? 46.w : 24.w,
//                       height: _selectedIndex == 0 ? 46.h : 24.h,
//                     ),
//                   ),
//                 ),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(bottom: 4.h),
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                     transform: Matrix4.translationValues(0, _selectedIndex == 1 ? -10 : 0, 0),
//                     child: SvgPicture.asset(
//                       _selectedIndex == 1 ? AppIcons.offerIconActive : AppIcons.offerIconInactive,
//                       width: _selectedIndex == 1 ? 46.w : 24.w,
//                       height: _selectedIndex == 1 ? 46.h : 24.h,
//                     ),
//                   ),
//                 ),
//                 label: 'Offer',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(bottom: 4.h),
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                     transform: Matrix4.translationValues(0, _selectedIndex == 2 ? -10 : 0, 0),
//                     child: SvgPicture.asset(
//                       _selectedIndex == 2
//                           ? AppIcons.navigationScanActiveIcon
//                           : AppIcons.navigationScanInActiveIcon,
//                       width: _selectedIndex == 2 ? 46.w : 24.w,
//                       height: _selectedIndex == 2 ? 46.h : 24.h,
//                     ),
//                   ),
//                 ),
//                 label: 'Scan',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(bottom: 4.h),
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                     transform: Matrix4.translationValues(0, _selectedIndex == 3 ? -10 : 0, 0),
//                     child: SvgPicture.asset(
//                       _selectedIndex == 3 ? AppIcons.profileIconActive : AppIcons.profileIconInactive,
//                       width: _selectedIndex == 3 ? 46.w : 24.w,
//                       height: _selectedIndex == 3 ? 46.h : 24.h,
//                     ),
//                   ),
//                 ),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }