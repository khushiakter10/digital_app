import 'dart:io';
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class DottedCustomWidget extends StatefulWidget {
  final String text;
  final String textmb;
  final Widget icon;

  const DottedCustomWidget({
    super.key,
    required this.text,
    required this.textmb,
    required this.icon,
  });

  @override
  State<DottedCustomWidget> createState() => _DottedCustomWidgetState();
}

class _DottedCustomWidgetState extends State<DottedCustomWidget> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.cE8E8E8,
      strokeWidth: 1.5,
      dashPattern: const [6, 4],
      borderType: BorderType.RRect,
      radius: Radius.circular(12.r),
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.cFFFFFF,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: _pickedImage == null
                      ? Center(child: widget.icon)
                      : Image.file(
                    _pickedImage!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                UIHelper.verticalSpace(24.h),
                Text(
                  widget.text,
                  style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
                UIHelper.verticalSpace(8.h),
                Text(
                  widget.textmb,
                  style: TextFontStyle.titleStyle14w400c757575Manrope,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}













//
//
// import 'dart:io';
// import 'package:brayne_digital_app/assets_helper/app_colors.dart';
// import 'package:brayne_digital_app/assets_helper/app_fonts.dart';
// import 'package:brayne_digital_app/helpers/ui_helpers.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
//
// class DottedCustomWidget extends StatefulWidget {
//   final String text;
//   final String textmb;
//   final Widget icon;
//
//   const DottedCustomWidget({
//     super.key,
//     required this.text,
//     required this.textmb,
//     required this.icon,
//   });
//
//   @override
//   State<DottedCustomWidget> createState() => _DottedCustomWidgetState();
// }
//
// class _DottedCustomWidgetState extends State<DottedCustomWidget> {
//   final ImagePicker _picker = ImagePicker();
//   File? _singleImage;
//   List<File> _multiImages = [];
//
//   Future<void> _pickSingleImage() async {
//     final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         _singleImage = File(pickedFile.path);
//       });
//     }
//   }
//
//   Future<void> _pickMultipleImages() async {
//     final List<XFile>? pickedFiles = await _picker.pickMultiImage();
//
//     if (pickedFiles != null && pickedFiles.isNotEmpty) {
//       setState(() {
//         _multiImages.clear();
//         _multiImages.addAll(pickedFiles.take(10).map((e) => File(e.path)));
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Dotted single image picker
//         DottedBorder(
//           color: AppColors.cE8E8E8,
//           strokeWidth: 1.5,
//           dashPattern: const [6, 4],
//           borderType: BorderType.RRect,
//           radius: Radius.circular(12.r),
//           child: GestureDetector(
//             onTap: _pickSingleImage,
//             child: Container(
//               padding: EdgeInsets.all(16.r),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: AppColors.cFFFFFF,
//                 borderRadius: BorderRadius.circular(12.r),
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 160.h,
//                     decoration: BoxDecoration(
//                       color: AppColors.cFFFFFF,
//                       borderRadius: BorderRadius.circular(12.r),
//                     ),
//                     child: _singleImage == null
//                         ? Center(child: widget.icon)
//                         : ClipRRect(
//                       borderRadius: BorderRadius.circular(12.r),
//                       child: Image.file(
//                         _singleImage!,
//                         width: double.infinity,
//                         height: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   UIHelper.verticalSpace(24.h),
//                   Text(widget.text,
//                       style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp),
//                       textAlign: TextAlign.center),
//                   UIHelper.verticalSpace(8.h),
//                   Text(widget.textmb,
//                       style: TextFontStyle.titleStyle14w400c757575Manrope,
//                       textAlign: TextAlign.center),
//                 ],
//               ),
//             ),
//           ),
//         ),
//
//         UIHelper.verticalSpace(24.h),
//
//         // Tap to upload multiple images
//         GestureDetector(
//           onTap: _pickMultipleImages,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Uploaded Offer Images",
//                   style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
//               UIHelper.verticalSpace(12.h),
//               _multiImages.isEmpty
//                   ? Container(
//                 width: double.infinity,
//                 height: 100.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12.r),
//                   border: Border.all(color: AppColors.cD1D1D1),
//                 ),
//                 alignment: Alignment.center,
//                 child: Text("Tap to upload up to 10 images",
//                     style: TextFontStyle.titleStyle14w400c757575Manrope),
//               )
//                   : SizedBox(
//                 height: 100.h,
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: _multiImages.length,
//                   separatorBuilder: (_, __) => UIHelper.horizontalSpace(8.w),
//                   itemBuilder: (context, index) {
//                     return ClipRRect(
//                       borderRadius: BorderRadius.circular(12.r),
//                       child: Image.file(
//                         _multiImages[index],
//                         width: 100.w,
//                         height: 100.h,
//                         fit: BoxFit.cover,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
