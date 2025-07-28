
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/features/advertiser/advertiser-profile/advertiser_profile/presentation/Advertiser_profile_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_all_vedio/presentation/advertiser_all_vedio_screen.dart';
import 'package:digital_app/features/advertiser/advertiser_home/presentation/advertiser_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdvertiserBottomNavScreen extends StatefulWidget {
  final int initialIndex;

  const AdvertiserBottomNavScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<AdvertiserBottomNavScreen> createState() => _AdvertiserBottomNavScreenState();
}

class _AdvertiserBottomNavScreenState extends State<AdvertiserBottomNavScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [
    AdvertiserHomeScreen(),
   AdvertiserAllVedioScreen(),
    AdvertiserProfileScreen(),


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
                    _selectedIndex == 1 ? AppIcons.vedioactive : AppIcons.vedioinactive,
                    width: _selectedIndex == 1 ? 46.w : 24.w,
                    height: _selectedIndex == 1 ? 46.h : 24.h,
                  ),
                ),
                label: 'Ads',
              ),

              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(0, _selectedIndex == 2 ? -27 : 0, 0),
                  child: SvgPicture.asset(
                    _selectedIndex == 2 ? AppIcons.profileactive : AppIcons.profileinactive,
                    width: _selectedIndex == 2 ? 46.w : 24.w,
                    height: _selectedIndex == 2 ? 46.h : 24.h,
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