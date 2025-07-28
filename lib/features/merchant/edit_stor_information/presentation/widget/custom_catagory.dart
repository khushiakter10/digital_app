// import 'package:brayne_digital_app/assets_helper/app_colors.dart';
// import 'package:brayne_digital_app/assets_helper/app_fonts.dart';
// import 'package:brayne_digital_app/assets_helper/app_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// /// ✅ Category Model
// class CategoryItem {
//   final String name;
//   final String icon;
//
//   CategoryItem({required this.name, required this.icon});
// }
//
// /// ✅ Category Card Widget
// class CategoryCard extends StatelessWidget {
//   final CategoryItem category;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   const CategoryCard({
//     super.key,
//     required this.category,
//     required this.isSelected,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         decoration: BoxDecoration(
//           color: const Color(0xFFFFF3EC),
//           borderRadius: BorderRadius.circular(12),
//           border: isSelected
//               ? Border.all(color: Colors.deepOrange, width: 2)
//               : Border.all(color: Colors.transparent),
//           boxShadow: isSelected
//               ? [
//             BoxShadow(
//               color: Colors.deepOrange.withOpacity(0.2),
//               blurRadius: 6,
//               offset: const Offset(0, 3),
//             ),
//           ]
//               : [],
//         ),
//         child: Row(
//           children: [
//             SvgPicture.asset(category.icon.toString()),
//             const SizedBox(width: 8),
//             Text(
//               category.name,
//               style:TextFontStyle.titleStyle14w400grey888E9CManrope.copyWith(
//                   color: AppColors.c757575
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//


