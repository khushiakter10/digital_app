

import 'dart:io';
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/features/advertiser/vedio_source/widget/custom_doted_widget.dart';
import 'package:digital_app/features/advertiser/vedio_source/widget/vedio_tabbar_widget.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';



class VideoSourceScreen extends StatefulWidget {
  const VideoSourceScreen({Key? key}) : super(key: key);

  @override
  State<VideoSourceScreen> createState() => _VideoSourceScreenState();
}

class _VideoSourceScreenState extends State<VideoSourceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ImagePicker _picker = ImagePicker();

  File? _selectedVideoFile;
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  Future<void> _pickVideoFromGallery() async {
    final XFile? pickedFile = await _picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      _selectedVideoFile = File(pickedFile.path);

      _videoController?.dispose();
      _videoController = VideoPlayerController.file(_selectedVideoFile!);

      await _videoController!.initialize();
      setState(() {
        _isVideoInitialized = true;
      });

      _videoController!.setLooping(true);
      _videoController!.play();
    }
  }

  Widget _buildVideoPreview() {
    if (_selectedVideoFile == null || !_isVideoInitialized || _videoController == null) {
      return SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.only(top: 16.h),
      height: 188.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.black,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          alignment: Alignment.center,
          children: [
            VideoPlayer(_videoController!),
            Positioned(
              bottom: 8.h,
              right: 8.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.c181818,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  _formatDuration(_videoController!.value.duration),
                  style: TextFontStyle.titleStyle14w500cFFFFFFManrope,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_videoController!.value.isPlaying) {
                    _videoController!.pause();
                  } else {
                    _videoController!.play();
                  }
                });
              },
              child: Icon(
                _videoController!.value.isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                size: 40.h,
                color: AppColors.cFFFFFF,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.cFFFFFF,
        appBar: CustomAppbarProfile(title: "Create New Ad.", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(24.h),
 //--------------------------------------- Tabbar  Vedio Scetion --------------------------------------------//
              VedioTabbarWidget(
                tabController: _tabController,
                tabTitles: ['Image Ad.', 'Video Ad.'],
              ),
              UIHelper.verticalSpace(24.h),
              Text(
                'Video Source',
                style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp),
              ),
              UIHelper.verticalSpace(8.h),
//-------------------------------------------- Done ------------------------------------------------//

 //------------------------------------------ Dotted ----------------------------------------------//

              CustomDottedWidget(
                tabController: _tabController,
                selectedImage: null,
                onPickImage: () async {

                  await _pickVideoFromGallery();
                },
              ),

              UIHelper.verticalSpace(24.h),

              Text(
                'Preview',
                style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp),
              ),

              UIHelper.verticalSpace(8.h),


              _buildVideoPreview(),
//-------------------------------------------------- Done ------------------------------------------//
            ],
          ),
        ),
 //-------------------------------------------  Button ----------------------------------------------------------//
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: CustomButton(
              name: "Next",
              context: context,
              color: AppColors.primary2,
              height: 56.h,
              borderRadius: 8.r,
              textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
              onCallBack: () {
                NavigationService.navigateTo(Routes.advertiserBottomNavScreen);
              },
            ),
          ),
        ),
      ),
    );
  }
}
