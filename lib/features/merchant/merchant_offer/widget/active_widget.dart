import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ActiveWidget extends StatelessWidget {
  final BorderRadius borderRadius;
  final String label;
  final bool isSelected;
  final bool isDisabled;

  const ActiveWidget({
    required this.borderRadius,
    required this.label,
    required this.isSelected,
    required this.isDisabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center, // Center the content
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: isSelected ? AppColors.primary2 : AppColors.white,
      ),
      child: Text(
        label,
        textAlign: TextAlign.center, // Ensure text is centered
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}