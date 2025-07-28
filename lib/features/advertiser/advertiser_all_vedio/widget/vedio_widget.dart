

import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class WidgetDesign extends StatefulWidget {
  final String title;
  final String type;
  final String sets;
  final String videoPath;
  final int index;

  const WidgetDesign({
    super.key,
    required this.title,
    required this.type,
    required this.sets,
    required this.videoPath,
    required this.index,
  });

  @override
  State<WidgetDesign> createState() => _WidgetDesignState();
}

class _WidgetDesignState extends State<WidgetDesign> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _showVideo = false;

  bool isLoved = false; // <-- Toggle state for love icon

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoPath)
      ..initialize().then((_) {
        setState(() => _isInitialized = true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(29.36.r),
            topRight: Radius.circular(29.36.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------- Video Section --------------------//
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(29.36.r),
                topRight: Radius.circular(29.36.r),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 188.h,
                child: _showVideo && _isInitialized
                    ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      VideoPlayer(_controller),
                      Positioned(
                        bottom: 8.h,
                        right: 8.w,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.c181818,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.h, horizontal: 10.w),
                            child: Text("09:56",
                                style: TextFontStyle
                                    .titleStyle14w500cFFFFFFManrope),
                          ),
                        ),
                      ),
                      if (!_controller.value.isPlaying)
                        SvgPicture.asset(AppIcons.vedioIcon, height: 36.h),
                    ],
                  ),
                )
                    : Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: Colors.black12,
                      width: double.infinity,
                      height: 188.h,
                    ),
                    Positioned(
                      top: 12.h,
                      left: 16.w,
                      right: 16.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.cFF4800,
                              borderRadius: BorderRadius.circular(48.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 19.w),
                              child: Text(
                                'Video Ad',
                                style: TextFontStyle
                                    .titleStyle14w500cFFFFFFManrope
                                    .copyWith(fontSize: 18.sp),
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            AppIcons.dotted,
                            height: 34.h,
                            width: 34.w,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showVideo = true;
                          _controller.play();
                        });
                      },
                      child: SvgPicture.asset(AppIcons.vedioIcon, height: 64),
                    ),
                  ],
                ),
              ),
            ),

            // -------------------- Text + Icons Section --------------------
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: TextFontStyle.titleStyle16w600c181818Manrope),
                  UIHelper.verticalSpace(9.h),
                  Row(
                    children: [
                      Text(widget.type,
                          style: TextFontStyle.titleStyle14w500c757575Manrope
                              .copyWith(fontSize: 16.sp)),
                      UIHelper.horizontalSpace(6.w),
                      Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: AppColors.c757575,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      UIHelper.horizontalSpace(6.w),
                      Text(widget.sets,
                          style: TextFontStyle.titleStyle14w500c757575Manrope
                              .copyWith(fontSize: 16.sp)),
                    ],
                  ),
                  UIHelper.verticalSpace(9.h),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.redCalander, height: 24.h),
                      UIHelper.horizontalSpace(8.w),
                      Text('May 15, 2025 - July 15, 2025',
                          style: TextFontStyle.titleStyle14w400c757575Manrope
                              .copyWith(fontSize: 16.sp)),
                    ],
                  ),
                  UIHelper.verticalSpace(9.h),

                  // -------------------- Like Row --------------------
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.lenceIcon, height: 24.h),
                      SizedBox(width: 8.w),
                      Text(
                        '1.2k views',
                        style: TextFontStyle.titleStyle14w400c757575Manrope
                            .copyWith(fontSize: 16.sp),
                      ),
                     UIHelper.horizontalSpace(15.w),

 //------------------------------------- Love Icon -----------------------------------//
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoved = !isLoved;
                          });
                        },
                        child: SvgPicture.asset(
                          AppIcons.loveIcon,
                          height: 24.h,
                          color: isLoved ? AppColors.c757575 : AppColors.cFF4800,
                        ),
                      ),
                    UIHelper.horizontalSpace(4.w),
                      Text(
                        '360 likes',
                        style: TextFontStyle.titleStyle14w400c757575Manrope
                            .copyWith(fontSize: 16.sp),
                      ),

                      const Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: ShapeDecoration(
                          color: AppColors.cFF4800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Expired',
                            style: TextFontStyle.titleStyle14w500cFFFFFFManrope,
                          ),
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
    );
  }
}















