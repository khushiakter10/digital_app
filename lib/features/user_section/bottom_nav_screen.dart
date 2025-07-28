
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/features/user_section/all_offer/presentation/all_offers_screen.dart';
import 'package:digital_app/features/user_section/user_home_section/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Profile/user_profile/presentation/user_profile_screen.dart';
import 'favourite/presentation/favourite_screen.dart';
import 'history_screen/presentation/history_screen.dart';
class UserMainBottomNavScreen extends StatefulWidget {
  final int initialIndex;

  const UserMainBottomNavScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<UserMainBottomNavScreen> createState() => _UserMainBottomNavScreenState();
}

class _UserMainBottomNavScreenState extends State<UserMainBottomNavScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [

    UserHomeScreen(),
    FavoriteScreen(),
    AllOffersScreen(),
    HistoryScreen(),
    UserProfileScreen(),
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
                    _selectedIndex == 1 ? AppIcons.loveIconActive : AppIcons.loveIconInactive,
                    width: _selectedIndex == 1 ? 46.w : 24.w,
                    height: _selectedIndex == 1 ? 46.h : 24.h,
                  ),
                ),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(0, _selectedIndex == 2 ? -27 : 0, 0),
                  child: SvgPicture.asset(
                    _selectedIndex == 2 ? AppIcons.offerIconActive : AppIcons.offerIconInactive,
                    width: _selectedIndex == 2 ? 46.w : 24.w,
                    height: _selectedIndex == 2 ? 46.h : 24.h,
                  ),
                ),
                label: 'Offer',
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(0, _selectedIndex == 3 ? -27 : 0, 0),
                  child: SvgPicture.asset(
                    _selectedIndex == 3 ? AppIcons.historyIconActive : AppIcons.historyIconInactive,
                    width: _selectedIndex == 3 ? 46.w : 24.w,
                    height: _selectedIndex == 3 ? 46.h : 24.h,
                  ),
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(0, _selectedIndex == 4 ? -27 : 0, 0),
                  child: SvgPicture.asset(
                    _selectedIndex == 4 ? AppIcons.profileIconActive : AppIcons.profileIconInactive,
                    width: _selectedIndex == 4 ? 46.w : 24.w,
                    height: _selectedIndex == 4 ? 46.h : 24.h,
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