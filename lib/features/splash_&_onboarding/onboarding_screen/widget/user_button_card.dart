// import 'package:brayne_digital_app/assets_helper/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class UserButtonCard extends StatefulWidget {
//   final List<List<String>> timeSlots;
//   final double containerWidth;
//   final double containerHeight;
//   final double verticalSpacing;
//   final TextStyle textStyle;
//   final Color borderColor;
//   final double borderRadius;
//   final Color selectedColor;
//   final Color unselectedColor;
//
//   const UserButtonCard({
//     Key? key,
//     required this.timeSlots,
//     this.containerWidth = 260,
//     this.containerHeight = 45,
//     this.verticalSpacing = 8,
//     this.textStyle = const TextStyle(
//       color: Color(0xFF2F2F2F),
//       fontSize: 14,
//       fontFamily: 'Manrope',
//       fontWeight: FontWeight.w600,
//       height: 1.5,
//     ),
//     this.borderColor = AppColors.whiteF3F3F3,
//     this.borderRadius = 16,
//     this.selectedColor = AppColors.primary2,
//     this.unselectedColor = AppColors.whiteF3F3F3,
//   }) : super(key: key);
//
//   @override
//   _UserButtonCardState createState() => _UserButtonCardState();
// }
//
// class _UserButtonCardState extends State<UserButtonCard> {
//   int? _selectedRowIndex;
//   int? _selectedColIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: widget.timeSlots.asMap().entries.map((entry) {
//         final rowIndex = entry.key;
//         final times = entry.value;
//         return Column(
//           children: [
//             SizedBox(height: widget.verticalSpacing.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: times.asMap().entries.map((timeEntry) {
//                 final colIndex = timeEntry.key;
//                 final time = timeEntry.value;
//                 final isSelected =
//                     _selectedRowIndex == rowIndex && _selectedColIndex == colIndex;
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _selectedRowIndex = rowIndex;
//                       _selectedColIndex = colIndex;
//                     });
//                   },
//                   child: Container(
//                     width: widget.containerWidth.w,
//                     height: widget.containerHeight.h,
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                     decoration: ShapeDecoration(
//                       color: AppColors.whiteF3F3F3, // Set the inner color here
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                           width: 2.5,
//                           color: isSelected
//                               ? widget.selectedColor
//                               : widget.unselectedColor,
//                         ),
//                         borderRadius: BorderRadius.circular(widget.borderRadius),
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         time,
//                         textAlign: TextAlign.center,
//                         style: widget.textStyle,
//                       ),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: widget.verticalSpacing.h),
//           ],
//         );
//       }).toList(),
//     );
//   }
// }


import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserButtonCard extends StatefulWidget {
  final List<List<String>> timeSlots;
  final double containerWidth;
  final double containerHeight;
  final double verticalSpacing;
  final TextStyle textStyle;
  final Color borderColor;
  final double borderRadius;
  final Color selectedColor;
  final Color unselectedColor;
  final Function(String)? onRoleSelected; // Ensure this is included

  const UserButtonCard({
    Key? key,
    required this.timeSlots,
    this.containerWidth = 260,
    this.containerHeight = 55,
    this.verticalSpacing = 8,
    this.textStyle = const TextStyle(
      color: Color(0xFF2F2F2F),
      fontSize: 14,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),
    this.borderColor = AppColors.whiteF3F3F3,
    this.borderRadius = 16,
    this.selectedColor = AppColors.primary2,
    this.unselectedColor = AppColors.whiteF3F3F3,
    this.onRoleSelected, // Ensure this is included
  }) : super(key: key);

  @override
  _UserButtonCardState createState() => _UserButtonCardState();
}

class _UserButtonCardState extends State<UserButtonCard> {
  int? _selectedRowIndex;
  int? _selectedColIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.timeSlots.asMap().entries.map((entry) {
        final rowIndex = entry.key;
        final times = entry.value;
        return Column(
          children: [
            SizedBox(height: widget.verticalSpacing.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: times.asMap().entries.map((timeEntry) {
                final colIndex = timeEntry.key;
                final time = timeEntry.value;
                final isSelected =
                    _selectedRowIndex == rowIndex && _selectedColIndex == colIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedRowIndex = rowIndex;
                      _selectedColIndex = colIndex;
                    });
                    if (widget.onRoleSelected != null) {
                      widget.onRoleSelected!(time); // Calling the callback
                    }
                  },
                  child: Container(
                    width: widget.containerWidth.w,
                    height: widget.containerHeight.h,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: ShapeDecoration(
                      color: AppColors.whiteF3F3F3,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2.5,
                          color: isSelected
                              ? widget.selectedColor
                              : widget.unselectedColor,
                        ),
                        borderRadius: BorderRadius.circular(widget.borderRadius),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        time,
                        textAlign: TextAlign.center,
                        style: widget.textStyle,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: widget.verticalSpacing.h),
          ],
        );
      }).toList(),
    );
  }
}