import 'package:flutter/material.dart';

class DayCard extends StatelessWidget {
  final String day;

  const DayCard({required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 48,
      decoration: ShapeDecoration(
        color: const Color(0xFFFFEDE6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFFF4800),
              fontSize: 16,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
              height: 1.50,
            ),
          ),
        ],
      ),
    );
  }
}