import 'dart:async';
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/assets_helper/app_image.dart';
import 'package:digital_app/common_widgets/icon_card.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserScanQrCodeScreen extends StatefulWidget {
  const UserScanQrCodeScreen({super.key});

  @override
  State<UserScanQrCodeScreen> createState() => _UserScanQrCodeScreenState();
}

class _UserScanQrCodeScreenState extends State<UserScanQrCodeScreen> {
  late Duration _remainingTime;
  late Timer _timer;

  // Define your initial time here as a variable
  final Duration initialTime = const Duration(minutes: 4, seconds: 45);

  @override
  void initState() {
    super.initState();
    _remainingTime = initialTime; // Use the local variable
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        } else {
          timer.cancel();
          // Handle when timer reaches zero if needed
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              /// Header section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => NavigationService.goBack,
                      child: CustomIconCard(icon: AppIcons.backArrowIcon)),
                  Center(
                    child: Text(
                      "Discount Redemption",
                      style: TextFontStyle.titleStyle20w600c182245Manrope
                          .copyWith(fontSize: 19.04),
                    ),
                  ),
                  GestureDetector(
                      onTap: () => NavigationService.goBack(),
                      child: SvgPicture.asset(AppIcons.downloadIcon)),
                ],
              ),

              UIHelper.verticalSpace(33.h),

              Image.asset(
                AppImages.qrCode,
                width: double.infinity,
              ),
              UIHelper.verticalSpace(24.h),
              SizedBox(
                width: 300.w,
                child: Text(
                  textAlign: TextAlign.center,
                  "Show this QR code to the merchant to redeem your offer",
                  style: TextFontStyle.titleStyle16w500primary2Manrope
                      .copyWith(color: Colors.black),
                ),
              ),
              UIHelper.verticalSpace(16.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.clock),
                  UIHelper.horizontalSpace(10.w),
                  Text(
                    _formatDuration(_remainingTime),
                    style: TextFontStyle.titleStyle16w500primary2Manrope
                        .copyWith(
                        color: AppColors.cFF4800,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              UIHelper.verticalSpace(12.h),
              SizedBox(
                width: 300.w,
                child: Text(
                  textAlign: TextAlign.center,
                  "Time remaining",
                  style: TextFontStyle.titleStyle16w500primary2Manrope
                      .copyWith(color: Colors.black),
                ),
              ),

              UIHelper.verticalSpace(24.h),
              ElevatedButton(
                onPressed: () {


                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 53),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  backgroundColor: AppColors.cFF4800,
                  elevation: 4,
                  shadowColor: const Color(0x14000000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFFFF4800),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.rightSignIcon),
                    const SizedBox(width: 8),
                    Text(
                      'Confirm Redemption',
                      style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                        color: AppColors.cFFFFFF,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              UIHelper.verticalSpace(24.h),
              ElevatedButton(
                onPressed: () {


                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 53),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  elevation: 4,
                  shadowColor: const Color(0x14000000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFFFF4800),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text(
                      'Cancel',
                      style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                        color: AppColors.cFF4800,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}