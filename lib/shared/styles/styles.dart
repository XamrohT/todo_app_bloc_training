import 'package:flutter/material.dart';

class AppColors{
  static const Color  inactiveColor = Color.fromARGB(202, 198, 207, 220);
  static const Color activeColor = Colors.blueAccent;
  static const Color boxColors = Color.fromRGBO(245, 247, 249, 1);
  static const Color boxTextColors = Color.fromRGBO(141, 156, 184, 1);
}

class BoxStyles{
  static final BoxDecoration primaryBox = BoxDecoration(
    color: AppColors.boxColors,
    borderRadius: BorderRadius.circular(12),
    boxShadow: const[
      BoxShadow(
        color: AppColors.boxColors,
        blurRadius: 6,
        spreadRadius: 2,
        offset: Offset(2, 2),
      ),
    ],
  );
}